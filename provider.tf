terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.9.0"
    }
    shell = {
      source = "scottwinkler/shell"
      version = "1.7.10"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.38.0"
    }
    docker = {
      source = "calxus/docker"
      version = "3.0.0"
    }
  }
}
