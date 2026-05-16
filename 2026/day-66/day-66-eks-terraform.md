# Day 66 — Provision AWS EKS with Terraform Modules

## Objective
Provision a production-style Kubernetes cluster on AWS using Terraform modules.

---

## Project Structure

```bash
2026/
└── day-66/
    ├── day-66-eks-terraform.md
    ├── terraform-eks/
    │   ├── providers.tf
    │   ├── variables.tf
    │   ├── terraform.tfvars
    │   ├── vpc.tf
    │   ├── eks.tf
    │   └── outputs.tf
    └── k8s/
        └── nginx-deployment.yaml
```

---

## Terraform Modules Used

### VPC Module
terraform-aws-modules/vpc/aws

Purpose:
- VPC creation
- public/private subnets
- NAT gateway
- route tables
- internet gateway

---

### EKS Module
terraform-aws-modules/eks/aws

Purpose:
- EKS control plane
- IAM roles
- worker nodes
- launch templates
- security groups
- node groups

---

## Why EKS Needs Public + Private Subnets

Public subnets:
Used for:
- internet-facing load balancers
- ingress traffic

Private subnets:
Used for:
- worker nodes
- secure internal workloads

This improves security because worker nodes are not directly exposed.

---

## What Subnet Tags Do

Public:
"kubernetes.io/role/elb" = 1

Allows Kubernetes to place public load balancers.

Private:
"kubernetes.io/role/internal-elb" = 1

Allows internal load balancers.

Without these tags:
Kubernetes service provisioning can fail.

---

## Terraform Apply

Commands:

```bash
terraform init
terraform plan
terraform apply
```

Approx resources created:
30–45+

Creation time:
10–15 minutes

---

## kubectl Connection

```bash
aws eks update-kubeconfig --name terraweek-eks --region ap-south-1
```

Verification:

```bash
kubectl get nodes
kubectl get pods -A
kubectl cluster-info
```

Expected:
2 Ready nodes

---

## Nginx Deployment

Deployed:
- 3 replicas
- LoadBalancer service

Commands:

```bash
kubectl apply -f ../k8s/nginx-deployment.yaml
kubectl get svc
```

Access:
Nginx welcome page via ELB URL.

---

## Destroy Process

Delete workload first:

```bash
kubectl delete -f ../k8s/nginx-deployment.yaml
```

Then:

```bash
terraform destroy
```

---

## Verification Checklist

After destroy:

- No EKS cluster
- No worker nodes
- No NAT gateway
- No Elastic IP
- No VPC
- No Load Balancer

AWS account clean.

---

## Reflection

Compared to kind/minikube:

kind/minikube:
- local only
- lightweight
- fast

AWS EKS:
- production-ready
- managed control plane
- real networking
- IAM integration
- scalable
- cloud-native

Terraform makes infrastructure repeatable and destroyable.