# Bootstrapping using Argo CD

## Introduction

The k8s-finstrap leverages the [Argo CD's App of Apps](https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/) pattern. We use Helm to achieve this.

```bash
# finstrap
.
├── Chart.yaml # boiler plate chart.yaml
├── README.md 
├── finstrap-resources # ingress/cluster issuer
├── finstrap.yaml # parent app 
├── templates # child app templates (one file per app)
└── values.yaml # finstrap chart overrides: enable/disable apps
```

In this case, the parent app "**finstrap**" is installed along with its *child apps* which are rendered from `templates/` and `finstrap-resources/` directories.
By default, we have disabled most of the apps, but you can easily enable them by setting the flags in the [values.yaml](./values.yaml)

```yaml
# values.yaml
# Global
domain: 
storageClass: "do-block-storage"
# Application specific
bots:
  enable: false
guestbook:
  enable: false
kyverno:
  enable: false  
logging:
  enable: false
observability:
  enable: false
  pdkey:
  storageSize: 50Gi
  retention: 5d
traefik:
  enable: true  
trivy:
  enable: false
```

> **Note:** Save changes to the file as deemed fit and push the changes to the git repository. The finstrap follows a strict GitOps workflow, so all the changes need to be pushed to git to reflect the changes in the Kubernetes cluster.

## finstrap

```bash
# Let the bootstrap begin!
cd bootstrap
kubectl apply -f finstrap.yaml
```

### Access the ArgoCD Web UI

```bash
# Get the argo password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
# Expose the argocd-server and login with the credentials on localhost:8080
kubectl -n argocd port-forward svc/argocd-server 8080:80
# Open the browser and go to localhost:8080 to access Argo CD UI
# Login with username: `admin,` password: `paste the value from the previous step.`
```
![argocd-ui](../docs/argocd-ui.jpeg)
