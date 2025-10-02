# Terraform (Tofu) Quick Start

_<p style="text-align:center;">Abstract</p>_
Many who have chosen a career related to 
Computer Science (Information Technology) discover that 
the field demands continuous learning. I embrace this 
aspect of my chosen field. Over the years of coding and
product consulting,I've encountered a fair share 
of tools for replacing manual steps with automation.
In the Virtual Machine realm I encountered a lot of 
use of [Ansible](#https://docs.ansible.com/). I eventually
created a learning exercise for myself to better my
Ansible skill set. Recently I have noticed an increased
use of Infrastructure as Code (IaC). In particular the use
of HashiCorp Cloud Platform (HCP). I decided to do some 
personal skills development on this technology. Furthermore, I
would create a problem statement to solve which would exercise 
a number of [popular] skills at once. To this end I decided
to have IaC manage a scalable stateless environment using commonly
available free software. I eventually settled on
[OpenFaaS](#https://www.openfaas.com/) run via Kubernetes IN Docker
(KIND). I chose to use [OpenToFu](#https://opentofu.org/) 
(drop-in replacement for [Terraform](#https://www.hashicorp.com/en/products/terraform)) to avoid costs.

### Contents
1. [Environment](#environment)

### 1. Environment <a id="environment"/>
* Host: [Debian](https://www.debian.org/distrib/) 13.1.0
* Docker: Community Edition, [Docker-CE](https://docs.docker.com/engine/install/)
* IaC: [OpenTofu](#https://opentofu.org/docs/intro/install/)

* Kubernetes: [KIND](https://kubernetes.io/docs/tasks/tools/)
* Open Source Marketplace: [arkade](https://docs.openfaas.com/cli/install/)
* Microservices Command Line: [OpenFaaS Community Edition Command Line](https://docs.openfaas.com/cli/install/)
* Kubernetes CLI: [kubectl](https://kubernetes.io/docs/tasks/tools/)
* * 


kubectl config view --minify --raw --context=kind-faas-cluster  --output 'jsonpath={..cluster.certificate-authority-data}'




tofu init
tofu apply -auto-approve
tofu destroy -auto-approve


kind-faas-cluster

kubectl config view --minify --raw --context=kind-faas-cluster

users:
- name: kind-faas-cluster
  user:
  client-certificate-data:


https://docs.openfaas.com/deployment/kubernetes/

[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

* Microservices Command Line: [OpenFaaS](https://docs.openfaas.com/cli/install/)


```
.
|-- cluster
|   |-- main.tf
|   |-- output.tf
|   |-- provider.tf
|   |-- terraform.tfvars
|   `-- variables.tf
|-- faas-cluster-config
|-- install
|   |-- main.tf
|   |-- output.tf
|   |-- provider.tf
|   |-- terraform.tfvars
|   `-- variables.tf
|-- microservice
|   |-- main.tf
|   |-- output.tf
|   |-- provider.tf
|   |-- terraform.tfvars
|   `-- variables.tf
|-- main.tf
|-- output.tf
|-- provider.tf
|-- terraform.tfvars
`-- variables.tf
```





terraform apply -target=aws_security_group.my_sg -target=aws_security_group.my_2nd_sg

tofu apply -auto-approve -target=kind_cluster.faas-cluster
tofu apply -auto-approve -target=shell_script.openfaas

terraform apply -var-file=vars/prod.tfvars -lock-timeout=300s

module "servers" {
source = "./app-cluster"

servers = 5
}


kind_cluster.faas-cluster
shell_script.openfaas




-auto-approve -parallelism 1



arkade install openfaas-ce
kubectl get pods -n openfaas




kubectl config view --minify --flatten --context=kind-demo

kubectl config view --minify --flatten --context=kind-demo --output 'jsonpath={.users[?(@.name=="kind-demo")].user.client-certificate-data}'
kubectl config view --minify --flatten --context=kind-demo --output 'jsonpath={.clusters[0].cluster.certificate-authority-data}'



kubectl config view --minify --flatten --context=kind-demo --output 'jsonpath={.clusters.cluster.certificate-authority-data}'
kubectl config view --minify --flatten --context=kind-demo --output 'jsonpath={.clusters[?(@.cluster=="")].certificate-authority-data}'


clusters:
- cluster:
  certificate-authority-data: LS0


current-context: kind-demo
kind: Config
users:
- name: kind-demo
  user:
  client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZ


kubectl config view --minify --flatten --context=kind-demo --output 'jsonpath={.clusters.cluster.certificate-authority-data}'





variable "host" {
type = string
}

variable "client_certificate" {
type = string
}

variable "client_key" {
type = string
}

variable "cluster_ca_certificate" {
type = string
}

provider "kubernetes" {
host = var.host

client_certificate     = base64decode(var.client_certificate)
client_key             = base64decode(var.client_key)
cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}





certificate-authority-data




client_certificate     = base64decode(var.client_certificate)
... client-certificate-data
client_key             = base64decode(var.client_key)
cluster_ca_certificate = base64decode(var.cluster_ca_certificate)

apiVersion: v1
clusters:
- cluster:
  certificate-authority-data: LS0tLS1CRUdJTi


data "kubernetes_config_map" "example" {
metadata {
name = "kind-demo"
}
}




kubectl config view --minify --flatten --context=kind-demo
kubectl config view --minify --flatten --context=kind-demo --output 'jsonpath={.users[?(@.name=="kind-demo")].user.client-certificate-data}' 



[{"name":"kind-demo","user":{"client-certificate-data":"LS0tLS1CR


kubectl config view --minify --raw --output 'jsonpath={.users[?(@.name=="<USER_NAME>")].user.client-certificate-data}'


hashicorp/kubernetes






tofu destroy -auto-approve




resource "openfaas_function" "function_test" {
name            = "test-function"
image           = "functions/alpine:latest"
f_process       = "sha512sum"
#  labels {
#    Group       = "London"
#    Environment = "Test"
#  }

#  annotations {
#    CreatedDate = "Mon Sep  3 07:15:55 BST 2018"
#  }
}







* Microservices: [OpenFaaS Community Edition](https://docs.openfaas.com/deployment/kubernetes/)
* 




kubectl get pods -n openfaas

https://docs.openfaas.com/deployment/kubernetes/
Arkade

Ar
https://docs.openfaas.com/deployment/kubernetes/


vi faas-cluster-config

curl -sSL https://cli.openfaas.com | sudo -E sh

export OPENFAAS_PREFIX=ttl.sh/test
faas-cli new --lang dockerfile env


provider "openfaas" {
uri = var.openfaas_uri
tls_insecure = true # Set to false when using a TLS endpoint
user_name = "admin"
password = var.openfaas_password
}


resource "kubernetes_namespace" "example_namespace" {
metadata {
name = "my-app-namespace"
}
}


provider "openfaas" {
uri = var.openfaas_uri
tls_insecure = true # Set to false when using a TLS endpoint
user_name = "admin"
password = var.openfaas_password
}


resource "openfaas_function" "function_test" {
name      = "test-function"
image     = "alpine:latest"
f_process = "env"

labels = {
Group       = "London"
Environment = "Test"
}

limits {
memory = "20m"
cpu    = "100m"
}

secrets = {
superSecret = "secret value!!"
}

annotations = {
CreatedDate = "Mon Sep  3 07:15:55 BST 2018"
}
}


64  kubectl config view --minify --flatten --context=kind-demo
70  history | grep kube
77  vi kubernetes.tf
88  kubectl config view --minify --flatten --context=kind-demo
94  cd ../kubernetes/
96  vi kubernetes.tf
103  histoty | grep kube
104  history | grep kube
112  vi kubernetes.tf
128  vi kubernetes.tf
133  vi kubernetes.tf
135  kubectl config view --minify --flatten --context=kind-demo
144  cd kubernetes/
146  vi kubernetes.tf
151  cat kubernetes.tf
154  kubectl config view --minify --flatten --context=kind-demo
165  cat ../cluster/kubernetes.tf
175  vi ../cluster/kubernetes.tf
194  cd kubernetes
199  cd kubernetes/
203  history | grep kube



* Kubernetes CLI: [kubectl](https://kubernetes.io/docs/tasks/tools/)


kubectl
https://kubernetes.io/docs/tasks/tools/

kind
https://kubernetes.io/docs/tasks/tools/


* 
* 
* 
* 
Infrastructure as code (IaC) OpenTofu
  https://opentofu.org/docs/intro/install/
  https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/


[word](#anchor)

AlmaLinux 9.5
Infrastructure as code (IaC) OpenTofu
https://opentofu.org/docs/intro/install/
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/





create an self exercise to 



Declarative Configuration: You write configuration 
files in Terraform's language (HCL) to describe

HCP, or the HashiCorp Cloud Platform
Terraform language
"HCL" is most commonly known as the HashiCorp Configuration Language


https://docs.ansible.com/


consultant
agile
full stack
Software Development Life Cycle (SDLC)
DevOps




1. [Introduction](#introduction)
2. [Sentinel Configuration](#sentinel-configuration)
    1. [Tracking Objects](#tracking-objects)
    2. [server.properties](#server.properties)
3. [Web Dashboard Installation & Configuration](#web-dashboard-installation-&-configuration)
    1. [Import Dashboards](#import-dashboards)
    2. [Verify Dashboards](#verify-dashboards)
4. [Change Log](#change-log)

## Introduction


## Introduction <a id="introduction"/>


https://docs.docker.com/engine/install/

https://kind.sigs.k8s.io/docs/user/quick-start/


"Kind" (Kubernetes IN Docker)

0.9.0

terraform {
required_providers {
kind = {
source = "tehcyx/kind"
version = "0.4.0"
}
}
}

provider "kind" {}


https://docs.openfaas.com/deployment/kubernetes/

publish
tofu apply -auto-approve
tofu destroy -auto-approve

curl -sLSf https://cli.openfaas.com | sudo sh
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml




faas-cluster-control-plane

kind create cluster --name openfaas

kubectl config view --minify --flatten --context=kind-demo

faas-cluster-control-plane


```
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    labels = {
      App = "ScalableNginxExample"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "ScalableNginxExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableNginxExample"
        }
      }
      spec {
        container {
          image = "nginx:stable-alpine-slim"
          name  = "example"

          port {
            container_port = 8088
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
```
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
```
terraform {
required_providers {
kubernetes = {
source = "hashicorp/kubernetes"
}
}
}

variable "host" {
type = string
}

variable "client_certificate" {
type = string
}

variable "client_key" {
type = string
}

variable "cluster_ca_certificate" {
type = string
}

provider "kubernetes" {
host = var.host

client_certificate     = base64decode(var.client_certificate)
client_key             = base64decode(var.client_key)
cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}
```
cccccccccccccccccccccccccccccccccccccccccccccc
```
host                   = "https://127.0.0.1:44253"
client_certificate     = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURLVENDQWhHZ0F3SUJBZ0lJY3luWUl4ZjVIMFF3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TlRBNU1qQXhORFUzTlRCYUZ3MHlOakE1TWpBeE5UQXlOVEJhTUR3eApIekFkQmdOVkJBb1RGbXQxWW1WaFpHMDZZMngxYzNSbGNpMWhaRzFwYm5NeEdUQVhCZ05WQkFNVEVHdDFZbVZ5CmJtVjBaWE10WVdSdGFXNHdnZ0VpTUEwR0NTcUdTSWIzRFFFQkFRVUFBNElCRHdBd2dnRUtBb0lCQVFDc2pHV04KZjIySFFKK3dmRHBnNkpFaTc3TGYyR0FIU0tXSEZsR3ZsK25iR2ViL004bjBUdWN4ZHZXbnYyQUFBam5rUktyegpFa1cyc2M0ODlsNll6ZmtNWFVIaVVTQmhVT1dDa09INHM1R2xHb1NPOTl6RG5idWEvdGV2S1FHallrUHBZTUkxCnFTdDlHZVdvSEYrVnNpdml2YkdxdDlZbGxPNFhNVjNVWGh4V3FjOTVTczBFNkU3OTRzY1ZpcjRScU0raklMUHEKNy9KM1FLc0FYbVVmOEVkYUg1MFoxMlFiZHZzZjF6dGZ5MitLdkZEOWtVVnlkUjZSVWZZWmNrTWE2NytkZzByYwpid0N1L3pFeUF4ZFRxL2hwSHIra0duUzRSVmlpRUZXcE91UVZJSGNRNjNVb0xJL0FSekR1Q3NYS2ZyUVhHc3B0CmtZUWJhTGNXdE0wS3dXRUxBZ01CQUFHalZqQlVNQTRHQTFVZER3RUIvd1FFQXdJRm9EQVRCZ05WSFNVRUREQUsKQmdnckJnRUZCUWNEQWpBTUJnTlZIUk1CQWY4RUFqQUFNQjhHQTFVZEl3UVlNQmFBRk9KSHdtYkxyVUxub3RwagovNFcyZXN5eVNFa2tNQTBHQ1NxR1NJYjNEUUVCQ3dVQUE0SUJBUUFpTEo5cDQrRzNLbjBOcGhsQjVnUnZaamUwCjJoVHBHQk5kSXBxSEowUmZQY2swckdUNG9oR01rR1RqQVhMQUpWRVRDeUNlTFc1T1dTS0J2UnNDaEd2RWx3bVgKRytJNXpTblFwbzhXY0k1bzZtWTZ6YlBIdVpKRlZvT1A2bjdnV2pxR2xQVUkzZ1I1TlpZTzFKWkt1c2VGUHVqRwpnUnZIaVNlNnRvM0JKbTBDRTlpNmFDV3hadTl4UG1CdHgyTzhPV0lveE9IVXlvUUVzVEEyZEtmWnJ3QncyNUw4Cllrb2xLalkwbVAvZksvNUowNlliRWx3ZDRSK2lPaUFiVGNyS1BiS2lXZm5XNUJFMmYzTHJGaFZ0OVcycnc3TGcKYU1kK3ZiampMc3BXSWJZaUMrZDVxaWxTY1VLZUY4dDdoSDhuNTk1ajdYVXBYY0tnRmxLbS9zUUNPOXR4Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
client_key             = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBckl4bGpYOXRoMENmc0h3NllPaVJJdSt5MzloZ0IwaWxoeFpScjVmcDJ4bm0velBKCjlFN25NWGIxcDc5Z0FBSTU1RVNxOHhKRnRySE9QUFplbU0zNURGMUI0bEVnWVZEbGdwRGgrTE9ScFJxRWp2ZmMKdzUyN212N1hyeWtCbzJKRDZXRENOYWtyZlJubHFCeGZsYklyNHIyeHFyZldKWlR1RnpGZDFGNGNWcW5QZVVyTgpCT2hPL2VMSEZZcStFYWpQb3lDejZ1L3lkMENyQUY1bEgvQkhXaCtkR2Rka0czYjdIOWM3WDh0dmlyeFEvWkZGCmNuVWVrVkgyR1hKREd1dS9uWU5LM0c4QXJ2OHhNZ01YVTZ2NGFSNi9wQnAwdUVWWW9oQlZxVHJrRlNCM0VPdDEKS0N5UHdFY3c3Z3JGeW42MEZ4cktiWkdFRzJpM0ZyVE5Dc0ZoQ3dJREFRQUJBb0lCQUE0c1NzRW9mam9yQnVoQgpEcTNjSEk1NzZ1WkpIZERXQTV3STFoL2F3TCtaclQyTzBhQUsybmNDZ3ZqSzdFWHVrNHZFK2kwVXkxRFBqUlc1CktrUlo2QzJVVVcrWFkxWUFXNWNjY3lYeHRnZStSRitCUzRzWk5JcEMzdVl6M2o4VWpoTW9PcVpHdXR3Lzd0QjAKRFlQbkg5b0pqb09XZ3lBUXozZkI1ZEpSQXFTTzZWcW5sWTNhOUNzTDcrbkhsSTZGSjhxR1NYQnpJQnpLNXlCZwpOcS9ycEY5SStaRHVPSUpqeUZyQ3ZBQlhHWDJva0NWaytTbGpvenlVT25NdVA1VDNZcnkvOXl4bzRWTWhkQk1BCk5vWkRCaUplZ2xacUhpWFpKNnRSL2ZRUFV1QXlXSUhjeVpwTzhFOXJyTjdScmFWLzNVMEhsZmw0b042TWtTWnUKRy9kc3dmRUNnWUVBMHFGZFAySS9lUnJRNUdpWXZ1TDFUNEpjZ0pjMEh3NC9ubFZJeFNFdDJpSGxzeUlBUE9qbgppT3NSci9KQWVyK2JQdytEcjVLajVzWDlKQlRyR3ZTSHFqNzVwR1prcndlUWM3TnVmL0FObXdFeStrenNIbVRHCitGdFlYVFRJclFDOEllc2ZLc0I4emRzeU1qSHhEZ1VWWmh0MWc5RStDdGpYWkw2c0Q0UzFJakVDZ1lFQTBiY2MKQzNwN2g1bzV0eGlxeGk2a3ZsSjlkSXZjdFNVWUNkOS9sNElOaXUvOUVNMUR0YTFKbjIvN2JiZkp5UWV1U2JUdQozS0MyYUF1R2M0Vmc1TTBMR04vQXF2Z09Eb2xoU2I4RlFlYXdCMS82OUg3Z1ViY0JXLzlXZmdFb2Q2S3ZDbStNCi9PQjN6M3FLek9PSG10RXdVNXVHY1pjZks0ZWhJZUtEQk16TXkvc0NnWUJkYU1KNXdaQjBuTGZYRTZ2cHU2MGUKdmFsWVBiWVhyN0gyL2N0djRPNzh0ZHV3UFh2dGh6eG5OQmg3OXVzeGhKZk10NHltNkZsWGxxWlV3aElodWlBUQpHQzJPQXZyVHhIOERVS2ZJaFNVRGdOeWl0RXBpa0Q3TkZYVnlvRjMrbXp6VHJmbjhjN0RsZWpnZ21wVlVxbHg3CkUrSmh1d0hRdmFtSVBDY0NHdEJaZ1FLQmdRQzNaNzlrSG5zWUxYM2FMZjEwRXVqSzlkTjM4TFZWeXBvS1VHY0MKdHA5bmFkalZMOTdPYlQxYzdZOWk5Zi9JQ3lxV2xXRHNuTFRKcTRLclZ2TlZSaWsxV01Ia0E4b3ZWbUE2SVkvVQpnWTVpOU1MQnZwQXBoclh1b2hFZlk1M2pldWhBWlN4VkgyNUlpbkFISGRuRFFMMVY4VWNUNGtsRlJYbGE3QUVQCldwaWtyd0tCZ0U1em1rTVY0RTIwUy8zelZLTmVjL2J1WlNkRkNiUjI4RkppZWFvQTBZUGFOaTRwWlVwVGxsQ08KZXBxNlo5L2ZHVGVhRVdkUUlEMFhjNVhvQkJNRXU1VmJrU2x3YUFSMFlsMldTbjhXTWliVnJZY2J3U1BPQzNDVgpvUStteWlzYlR1cjRHZTdkakxjYTRxRENodUpPMXlnVjZCZVZVOUMwMm8xSFFUVFN1MC9OCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg=="
cluster_ca_certificate = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJQnBseXVRN1laeVF3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TlRBNU1qQXhORFUzTlRCYUZ3MHpOVEE1TVRneE5UQXlOVEJhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUUM2WElGTmdCaXNUazBzeUpGUHgzZXo2dS8xZ3VNTy9kd2U3cmtORzJ3Q2tRM2krUXl0Z3laMFdNT1EKemRkTlQzQjN3YUpqWkZkckJSZmw2VndpL3ZCZ2tLVnlJcEhHNnREcTBzZUhCVWhXWmtqdUY1L2Fsa2hiblRVdgpkbTBJL2c4UkZGWDAxZmJtNjBSdHdwbkI1Q3Bkd1RJWUdTQjNRbDRsKzhnYW1PaVFycEZSMUlyY3lkY0I4Y3pTCnpFWHhQS0o3TTRVQWZFQnFwVHZ6KzZNRUsyTkd0cEF3eGZqanRNdEExdjcwcE1ROHZDVnN5YXVXdWl5TnBiWHYKQTBUL3lzcEcyWVZERW80Qlozakx0ZGpZYlhpZmpHbTgySWNPaEl5ZVU4V3FhdFpVQ1hzSmtVQmxXMWU1YktqOQpsVlV5ZWVkOXlzZExaWjRCVGFVZVJxQmVnb2k3QWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJUaVI4Sm15NjFDNTZMYVkvK0Z0bnJNc2toSkpEQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQjVweEQ3TnNJNwprS1BFdUQ0UmJvVHgzUEczNlR2WGM1RG9UUDVrcFZ3WnAwVDdkNk04YjE0WHMwTjAxNGRmaVlmeGoxWXBsL1kzCmZqUlRFcFdNSmNUbkxUaHhGL0Z3dTd0aHFOUG1sZFQ1b2ZQVW1qaE5wYnYvck5Md3l1MW5oZS9JR3lEZGpWOVMKUXk1QUlUeFRLdDVqQXFHTXU2cTRYbXBWdTNJS0pWVVN6QitEbDhkSWt0UWVrcGVyUjJxLzY5V1pZeHJhZU5TeQpoQ0c5WklPbnlkNmxGbzJLaGZscXhBeVBqdFFsUDNPaVdiZGpkUGdjQkY1Z0syNlZ3L3huMnpQSDR5dTRRYVpRCm1GTGlQZWhpRmI1eVExOGxiVGxkUmRxSjRVVE9lOUpUTnJiYjBYWkhkYkt5RXlheGN5a0Rob0xZYW9nUUJyZVUKMW92alMvQkpiNDFUCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
```


# Create a kind cluster of the name "test-cluster" with kubernetes version in
link [kind
defaults](https://github.com/kubernetes-sigs/kind/blob/master/pkg/apis/config/defaults/image.go#L21)
resource "kind_cluster" "default" {
name = "test-cluster"
}




file_id      = proxmox_virtual_environment_download_file.debian_12_generic_image.id

resource "proxmox_virtual_environment_download_file" "debian_12_generic_image" {
provider     = proxmox.euclid
node_name    = var.euclid.node_name
content_type = "iso"
datastore_id = "local"

file_name          = "debian-12-generic-amd64-20240201-1644.img"
url                = "https://cloud.debian.org/images/cloud/bookworm/20240211-1654/debian-12-generic-amd64-20240211-1654.qcow2"
checksum           = "b679398972ba45a60574d9202c4f97ea647dd3577e857407138b73b71a3c3c039804e40aac2f877f3969676b6c8a1ebdb4f2d67a4efa6301c21e349e37d43ef5"
checksum_algorithm = "sha512"
}






kubectl config view --minify --flatten --context=kind-demo


tofu init 
tofu plan -auto-approve
tofu apply -auto-approve


kubectl config view --minify --flatten --context=kind-demo



AlmaLinux 9.5
Infrastructure as code (IaC) OpenTofu
https://opentofu.org/docs/intro/install/
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/


kind --version


# Configure the Kind Provider
provider "kind" {}

# Create a cluster
resource "kind_cluster" "default" {
name = "test-cluster"
}




./install-opentofu.sh --install-method rpm

kubectl config view --minify --flatten --context=kind-demo



# Download the installer script:
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
# Alternatively: wget --secure-protocol=TLSv1_2 --https-only https://get.opentofu.org/install-opentofu.sh -O install-opentofu.sh
# Give it execution permissions:
chmod +x install-opentofu.sh
# Please inspect the downloaded script
# Run the installer:
./install-opentofu.sh --install-method rpm
# Remove the installer:
rm -f install-opentofu.sh


## Change Log <a id="change-log"/>




faas-cluster-control-plane	running
-	kindest/node:v1.33.1
- 42947:6443


======================================================================
kind_cluster.faas-cluster: Still creating... [20s elapsed]
kind_cluster.faas-cluster: Creation complete after 23s [id=faas-cluster-]
╷
│ Error: Error occured during shell execution.
│ Error:
│ exit status 1
│
│ Command:
│ arkade install openfaas-ce
│
│ StdOut:
│ Using Kubeconfig: /root/.kube/config[Warning] unable to create secret basic-auth, may already exist: error: failed to create secret Post "https://127.0.0.1:35479/api/v1/namespaces/openfaas/secrets?fieldManager=kubectl-create&fieldValidation=Strict": dial tcp 127.0.0.1:35479: connect: connection refusedClient: x86_64, Linux"openfaas" has been added to your repositoriesHang tight while we grab the latest from your chart repositories......Successfully got an update from the "openfaas" chart repositoryUpdate Complete. ⎈Happy Helming!⎈VALUES [values.yaml]Command: /root/.arkade/bin/helm [upgrade --install openfaas openfaas/openfaas --namespace openfaas --values /tmp/charts/openfaas/values.yaml --set basic_auth=true --set serviceType=NodePort --set basicAuthPlugin.replicas=1 --set gateway.replicas=1 --set queueWorker.replicas=1 --set queueWorker.maxInflight=1]
│
│ StdErr:
│ 2025/09/24 07:38:05 User dir established as: /root/.arkade/Error: Kubernetes cluster unreachable: Get "https://127.0.0.1:35479/version": dial tcp 127.0.0.1:35479: connect: connection refusedError: exit code 1, stderr: Error: Kubernetes cluster unreachable: Get "https://127.0.0.1:35479/version": dial tcp 127.0.0.1:35479: connect: connection refused
│
│ Env:
│ []
│
│
│
│   with shell_script.openfaas,
│   on main.tf line 52, in resource "shell_script" "openfaas":
│   52: resource "shell_script" "openfaas" {
======================================================================

