terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.94.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}

# Provider Configuration (Kubernetes)
provider "kubernetes" {
  config_path = "~/.kube/config"  # Update with your kubeconfig path
}

# Kubernetes Manifest Resource
resource "kubernetes_manifest" "finstrap" {
  yaml_body = file("${path.module}/finstrap/finstrap.yaml")  # Path to your YAML file
}

# External Data Source to Apply the Manifest Using kubectl
data "external" "apply_manifest" {
  program = ["kubectl", "apply", "-f", "${path.module}/finstrap/finstrap.yaml"]
}
