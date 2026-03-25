# Day 52 – Kubernetes Namespaces and Deployments

## What are Namespaces?

Namespaces are used to organize and isolate resources in a Kubernetes cluster.

Example:
- dev → development
- staging → testing
- production → live apps

---

## Deployment Manifest Explanation

- apiVersion: apps/v1 → required for deployments
- kind: Deployment → defines resource type
- metadata: name, namespace, labels
- replicas: number of pods to maintain
- selector: connects deployment to pods
- template: blueprint for pod creation

---

## Pod vs Deployment

- Pod:
  - Runs container
  - No recovery if deleted

- Deployment:
  - Maintains desired number of pods
  - Automatically recreates failed pods

---

## Scaling

Imperative:
kubectl scale deployment nginx-deployment --replicas=5 -n dev

Declarative:
Update replicas in YAML and apply again

---

##  Rolling Updates

- Updates happen gradually (zero downtime)
- Old pods replaced one by one

Rollback:
kubectl rollout undo deployment/nginx-deployment -n dev

---

##  Key Learning

Deleting a Pod:
- Standalone Pod → permanently deleted
- Deployment Pod → recreated automatically

---

##  Summary

- Namespaces organize cluster
- Deployments manage pods
- Scaling & updates are automated
- Kubernetes ensures desired state