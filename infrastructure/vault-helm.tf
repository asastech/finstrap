resource "helm_release" "vault" {
  name       = var.vault_helm_release_name
  namespace  = var.vault_k8s_namespace
  repository = var.vault_helm_repo
  chart      = var.vault_helm_chart
  version    = var.vault_helm_chart_version# Update to the desired Vault Helm chart version
  timeout    = var.vault_helm_chart_timeout_seconds
  create_namespace = true

  set {
    name  = "server.dev.enabled"
    value = "true"
  }
}