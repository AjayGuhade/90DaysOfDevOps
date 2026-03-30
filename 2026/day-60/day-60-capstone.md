## ⚙️ Kubernetes Cluster Setup (Kind)

This project uses **Kind (Kubernetes IN Docker)** for local cluster setup.

### Create Cluster


    kind create cluster --name capstone-cluster

### Verify Cluster

    kubectl cluster-info
    kubectl get nodes



###  Access Application (IMPORTANT CHANGE)


##  Access Application

- Since Kind runs inside Docker, 
- NodePort is not directly accessible via IP like Minikube.

###  Use Port Forwarding


    kubectl port-forward svc/wordpress 8080:80 -n capstone

### Now open in browser:

http://localhost:8080


###  Exposing NodePort in Kind

Kind requires extra port mapping to access NodePort externally.

Example Kind config:


    kind: Cluster
    apiVersion: kind.x-k8s.io/v1alpha4
    nodes:
    - role: control-plane
      extraPortMappings:
      - containerPort: 30080
        hostPort: 30080

Then access:

http://localhost:30080

## Why This Matters

I used:

- ✅ Kind (closer to real containerized environments)

👉 This shows:
- Better understanding of Kubernetes networking

- Real DevOps mindset

