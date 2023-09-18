# Provider Configuration (Kubernetes)
provider "kubernetes" {
  config_path = "~/.kube/config"  # Update with your kubeconfig path
}

# # Kubernetes Manifest Resource
# resource "kubernetes_finstrap" "finstrap" {
#   yaml_body = file("${path.module}/finstrap/finstrap.yaml")  # Path to your YAML file
# }

# External Data Source to Apply the Manifest Using kubectl
data "external" "finstrap" {
  program = ["kubectl", "apply", "-f", "${path.module}/finstrap/finstrap.yaml"]
}
