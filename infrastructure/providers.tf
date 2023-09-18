# Provider Configuration (Kubernetes)
provider "kubernetes" {
  config_path = "~/.kube/config"  # Update with your kubeconfig path
}

# Kubernetes Manifest Resource
resource "kubernetes_manifest" "my_app" {
  yaml_body = file("${path.module}/finstrap/finstrap.yaml")  # Path to your YAML file
}

# External Data Source to Apply the Manifest Using kubectl
data "external" "apply_manifest" {
  program = ["kubectl", "apply", "-f", "${path.module}/finstrap/finstrap.yaml"]
}
