resource "helm_release" "vault" {
  name       = "vault"
  namespace  = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.25.0" # Update to the desired Vault Helm chart version

  set {
    name  = "server.dev.enabled"
    value = "true"
  }
}