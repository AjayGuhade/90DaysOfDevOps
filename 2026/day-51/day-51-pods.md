# Day 51 – Kubernetes Pods

## 📌 Kubernetes Manifest Structure

Every Kubernetes resource has 4 main fields:

- apiVersion: Defines API version (v1 for Pods)
- kind: Type of resource (Pod)
- metadata: Name and labels
- spec: Desired state (containers, image, ports)



 Nginx Pod


 
BusyBox Pod


Multi Label Pod


## Imperative vs Declarative
### Imperative:

    kubectl run redis-pod --image=redis
Quick but not reusable

### Declarative:

    kubectl apply -f nginx.yaml

Version-controlled and production-ready

    kubectl get pods

(Add screenshot here)

### What happens when a Pod is deleted?

It is permanently deleted

No auto-recreation
Because no controller manages it

### Key Learnings
Pods are smallest deployable unit

YAML manifests define desired state

Labels help in filtering resources

Declarative approach is best practice

