# Kubernetes  finstrap: An Extendable Framework to Set Up Production Grade Clusters

## Introduction

"*Production-grade*" is a loaded term. What constitutes production readiness will vary according to your use case. While a Kubernetes cluster is production-ready the moment it is ready to serve traffic, there is a commonly agreed set of minimum requirements, as shown in the infographic below.

<p align="center">
<img src="./docs/pionative.png" alt="k8s-prod" width=800>
</p>


## Kubernetes Finstrap

The [**k8s-finstrap**](https://github.com/asastech/finstrap) project is a customizable and extendable framework that aims to solve this problem by leveraging

- [Terraform](https://www.terraform.io/): Compose a production ready infrastructure on Kubernetes
- [Vault](https://www.vaultproject.io/):  Kubernetes clusters with the power of Vault and dynamic secrets
- [Argo CD](https://argo-cd.readthedocs.io/en/stable/): Application configuration management and delivery using GitOps

This project integrates popular battle-tested open-source software and solutions that provide a production-grade out-of-box Kubernetes experience.

##  Overview

```bash
.

├── LICENSE
├── README.md 
├── argocd # Argo CD configurations (optional)
├── finstrap # cluster bootstrapping using Argo CD
├── docs # documents and assets
├── infrastructure # infrastructure automation using Terraform
  
```
## Using Terraform to Provision Infrastructure on Kubernetes

Follow the below steps to get started:

1. Clone this repo and change the directory to `infrastructure`
2. Initialize Terraform backend:

    ```shell
    terraform init
    ```

3. Copy and rename the `finstrap.tfvars.backup` file to `finstrap.tfvars`:

    ```shell
    cp finstrap.tfvars.sample finstrap.tfvars
    ```

4. Open the `finstrap.tfvars` file and adjust settings according to your needs using a text editor of your choice (preferably with [HCL](https://github.com/hashicorp/hcl/blob/main/hclsyntax/spec.md) lint support).
5. Use `terraform plan` to inspect infra changes before applying:

    ```shell
    terraform plan -var-file=finstrap.tfvars -out tf-finstrap.out
    ```

6. If you're happy with the changes, issue `terraform apply`:


###  Tear down the finstrap Cluster

Had fun trying out the *k8s-finstrap*? Time to say goodbye!

# Run
 optional deployment Kubernetes single-node

 ./install-script.sh

```bash
# Run
cd infrastructure/terraform
terraform destroy --var-file=finstrap.tfvars --auto-approve
# Bye Bye!
```

----