
data "external" "kubectl_apply" {
  program = ["kubectl", "apply", "-f", "${path.module}/finstrap/finstrap.yaml"]
}