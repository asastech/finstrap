cluster_name = "gitops"



 cluster_version = "1.26.6"

# ================================== ARGOCD CONFIG ==================================

# ArgoCD Helm release is disabled for now because it is not working properly in Terraform
enable_argocd_helm_release        = true
argocd_helm_repo                  = "https://argoproj.github.io/argo-helm"
argocd_helm_chart                 = "argo-cd"
argocd_helm_chart_version         = "5.16.14"
argocd_helm_release_name          = "argocd"
argocd_helm_chart_timeout_seconds = 600
argocd_k8s_namespace              = "argocd"

argocd_additional_helm_values_file = "argocd-ha-helm-values.yaml"
