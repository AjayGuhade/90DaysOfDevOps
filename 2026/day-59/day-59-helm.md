# Day 59 – Helm — Kubernetes Package Manager

## 🚀 What is Helm?

Helm is the **package manager for Kubernetes**, similar to apt/yum for Linux.

Instead of writing multiple YAML files manually, Helm allows you to deploy applications using **pre-configured packages called charts**.



## 🔑 Core Concepts

- **Chart** → A package of Kubernetes manifests (Deployment, Service, etc.)
- **Release** → A running instance of a chart in the cluster
- **Repository** → A collection of Helm charts (like Bitnami repo)

---

## Task 1: Install Helm

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

### Verify installation:

    helm version
    helm env
## Task 2: Add Repository & Search Charts

    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo update
    helm search repo nginx
    helm search repo bitnami
## Task 3: Install a Chart

    helm install my-nginx bitnami/nginx

### Verify resources:

    kubectl get all
    helm list
    helm status my-nginx
    helm get manifest my-nginx

✔ One command created Deployment, Service, ConfigMap automatically.

## Task 4: Customize with Values

### Check default values:

    helm show values bitnami/nginx

### Install with overrides:

    helm install custom-nginx bitnami/nginx \
      --set replicaCount=3 \
      --set service.type=NodePort

### Using values file:

    helm install nginx-values bitnami/nginx -f custom-values.yaml

### Verify:

    helm get values nginx-values

## Task 5: Upgrade & Rollback

### Upgrade release:

    helm upgrade my-nginx bitnami/nginx --set replicaCount=5

### Check history:

    helm history my-nginx

### Rollback:

    helm rollback my-nginx 1

✔ Rollback creates a new revision instead of overwriting.

## Task 6: Create Your Own Chart

### Create chart:

    helm create my-app

### Structure:

    my-app/
      Chart.yaml
      values.yaml
      templates/

### Example template:

    replicas: {{ .Values.replicaCount }}
    name: {{ .Chart.Name }}

### Validate:

    helm lint my-app

### Preview:

    helm template my-release ./my-app

### Install:

    helm install my-release ./my-app

### Upgrade:

    helm upgrade my-release ./my-app --set replicaCount=5

## Task 7: Clean Up

    helm uninstall my-nginx
    helm uninstall custom-nginx
    helm uninstall nginx-values
    helm uninstall my-release

### Verify:

    helm list

✔ Should show zero releases

### Helm Chart Structure Explained

- Chart.yaml → Metadata about chart
- values.yaml → Default configuration values
- templates/ → Kubernetes manifests with Go templating

### Go Templating Basics

Helm uses Go templating:

    {{ .Values.key }} → Access values.yaml
    {{ .Chart.Name }} → Chart name
    {{ .Release.Name }} → Release name

### custom-values.yaml Explained

    replicaCount: 3

    image:
      repository: nginx
      tag: "1.25"

    service:
      type: NodePort
      port: 80

    resources:
      limits:
        cpu: "200m"
        memory: "256Mi"
      requests:
        cpu: "100m"
        memory: "128Mi"

### Explanation:

- replicaCount → Number of pods
- image → Container image details
- service.type → Exposes app via NodePort
- resources → CPU & memory limits

## Key Learnings
- Helm simplifies Kubernetes deployments
- Charts replace multiple YAML files
- Values allow easy customization
- Upgrade & rollback manage releases efficiently
- Custom charts enable reusable deployments