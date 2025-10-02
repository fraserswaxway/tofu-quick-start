resource "kind_cluster" "faas-cluster" {
  name = "faas-cluster"
  node_image = "kindest/node:${var.kindest_tag}"
}

resource "shell_script" "openfaas" {
  depends_on = [kind_cluster.faas-cluster]
  lifecycle_commands {
    create = "arkade install openfaas-ce"
    delete = <<-EOF
          arkade uninstall openfaas-ce
		EOF

  }
}

resource "shell_script" "wait_for_pods" {
  depends_on = [shell_script.openfaas]
  lifecycle_commands {
    create = "kubectl wait pod --all -n openfaas --for=condition=ready --timeout=5m"
    delete = "echo"
  }
}

resource "null_resource" "port-forward" {
  depends_on = [shell_script.wait_for_pods]
  provisioner "local-exec" {
    quiet = true
    command = "nohup kubectl port-forward -n openfaas svc/gateway 8080:8080 > port-forward.log 2>&1 &"
  }
}

resource "shell_script" "initialize" {
  depends_on = [null_resource.port-forward]
  lifecycle_commands {
    create = <<-EOF
          sleep 5 # Wait a few seconds to make sure port forwarding is up
          rm -rf ./docker port-forward.log faas-cluster-config template
          mkdir -p ./docker
		  cd ./docker
          faas-cli new --lang dockerfile env
		EOF
    delete = <<-EOF
          rm -f *state* port-forward.log faas-cluster-config
		EOF
  }
}

resource "docker_image" "env" {
  depends_on = [shell_script.initialize]
  name = "env"
  build {
    path = "./docker/env"
    tag  = ["env:latest"]
    label = {
      author : "you"
    }
  }
}

resource "shell_script" "deploy" {
  depends_on = [docker_image.env]
  lifecycle_commands {
    create = <<-EOF
          faas-cli login -u admin -p $(kubectl -n openfaas get secret basic-auth -o jsonpath='{.data.basic-auth-password}' | base64 --decode)
          faas-cli store deploy env
          docker image rm -f $(sed -nE 's/.*(alpine:.*).*/\1/p' ./docker/env/Dockerfile)
          docker image rm -f $(sed -nE 's/.*(ghcr\S*).*/\1/p' ./docker/env/Dockerfile)
          rm -rf ./docker port-forward.log faas-cluster-config template
		EOF
    delete = <<-EOF
          docker image rm -f env:latest
		EOF
  }
}

resource "null_resource" "remove-image" {
  provisioner "local-exec" {
    when    = destroy
    quiet = true
    command = <<-EOF
        sleep 15
        docker image rm -f $(docker image list | grep "kindest/node" | sed -nE  "s/(kindest\/node\S*)\s*(\S*).*/\1:\2/p")
      EOF
  }
}
