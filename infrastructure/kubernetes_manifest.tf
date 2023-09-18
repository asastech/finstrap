
resource "kubernetes_manifest" "finstrap" {

  yaml_body = file("${path.module}/finstrap/finstrap.yaml")
}

data "external" "kubectl_apply" {
  program = ["kubectl", "apply", "-f", "${path.module}/finstrap/finstrap.yaml"]
}