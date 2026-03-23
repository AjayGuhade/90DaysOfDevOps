# Day 50 – Kubernetes Architecture & Cluster Setup ☸️

## 🚀 Overview

Today I started my Kubernetes journey by understanding its architecture and setting up a local cluster.

After working with Docker containers, I learned how Kubernetes helps manage and orchestrate containers at scale across multiple nodes.

---

## 🧠 Kubernetes Story (From Memory)

Kubernetes was created to solve the problem of managing containers at scale. While Docker helps run containers, it does not handle orchestration like scaling, self-healing, or load balancing.

Kubernetes was originally developed by Google and inspired by their internal system called Borg.

The name "Kubernetes" comes from Greek, meaning "helmsman" or "ship pilot", representing control and orchestration.

---

## 🏗️ Kubernetes Architecture

### 🔹 Control Plane (Master Node)

- **API Server**  
  Entry point of the cluster. All commands go through it.

- **etcd**  
  Key-value database storing cluster state.

- **Scheduler**  
  Decides which node a pod should run on.

- **Controller Manager**  
  Ensures desired state matches actual state.

---

### 🔹 Worker Node

- **kubelet**  
  Communicates with API server and manages pods.

- **kube-proxy**  
  Handles networking and service communication.

- **Container Runtime**  
  Runs containers (containerd, CRI-O, etc.)

---

## 🔄 What Happens Internally?

### 👉 kubectl apply -f pod.yaml

1. Request goes to API Server  
2. API Server stores state in etcd  
3. Scheduler assigns node  
4. kubelet creates pod on node  

---

### 👉 Failure Scenarios

- If API Server goes down → cluster becomes unmanageable  
- If worker node goes down → pods are rescheduled to another node  

---

## ⚙️ Tools Setup

### ✅ Installed kubectl

    kubectl version --client

## Local Cluster Setup
### Tool Used: kind (Kubernetes in Docker)

#### Why kind?
- Lightweight and fast
- Runs inside Docker
- Best for local DevOps practice


#### Cluster Creation
  
    kind create cluster --name devops-cluster

#### Verification

    kubectl cluster-info
    kubectl get nodes

### Exploring the Cluster
#### Commands Used
    kubectl cluster-info
    kubectl get nodes
    kubectl describe node <node-name>
    kubectl get namespaces
    kubectl get pods -A
    kubectl get pods -n kube-system

#### kube-system Pods (Core Components)

    etcd → stores cluster data
    kube-apiserver → handles API requests
    kube-scheduler → assigns pods to nodes
    kube-controller-manager → maintains desired state
    coredns → DNS inside cluster
    kube-proxy → networking

#### Cluster Lifecycle Practice

- Delete cluster

      kind delete cluster --name devops-cluster

- Recreate cluster

      kind create cluster --name devops-cluster

### Verify

    kubectl get nodes
### kubeconfig Explained

kubeconfig is a configuration file used by kubectl

It stores cluster details, credentials, and contexts

Default location:
~/.kube/config



    kubectl get nodes

    kubectl get pods -n kube-system

### Key Learnings
- Kubernetes solves container orchestration challenges
- Control plane manages the cluster, worker nodes run workloads
- Pods are the smallest deployable unit
- kubectl is used to interact with the cluster
- kind makes local Kubernetes setup simple and fast

###  Conclusion

Today I successfully set up my first Kubernetes cluster and explored its architecture.

This marks the beginning of my journey into container orchestration and cloud-native systems.

#90DaysOfDevOps #Kubernetes #DevOps #Cloud #DevOpsKaJosh