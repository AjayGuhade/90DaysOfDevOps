# Day 55 – Persistent Volumes (PV) and Persistent Volume Claims (PVC)

---

## 🚀 Why Containers Need Persistent Storage

Containers are **ephemeral** — when a Pod is deleted or restarted, all data inside it is lost.

This creates problems for:
- Databases
- Logs
- File storage
- Stateful applications

To solve this, Kubernetes provides **Persistent Volumes (PV)** and **Persistent Volume Claims (PVC)**.

---

## 📦 What are PV and PVC?

- **Persistent Volume (PV)**  
  A cluster-wide storage resource created by an admin.

- **Persistent Volume Claim (PVC)**  
  A request for storage by a user.

- **Relation**  
  PVC requests storage → Kubernetes binds it to a matching PV.

---

## ⚙️ Static vs Dynamic Provisioning

- **Static Provisioning**  
  Admin manually creates PV → user creates PVC → binding happens.

- **Dynamic Provisioning**  
  User creates PVC → Kubernetes automatically creates PV using a StorageClass.

---

## 📊 Access Modes

- **ReadWriteOnce (RWO)** → Read/write by a single node  
- **ReadOnlyMany (ROX)** → Read-only by multiple nodes  
- **ReadWriteMany (RWX)** → Read/write by multiple nodes  

---

## ♻️ Reclaim Policies

- **Retain** → Keeps data after PVC deletion  
- **Delete** → Deletes storage automatically  

---

## 🔹 Task 1: Data Loss with Ephemeral Pod

### Commands
kubectl apply -f ephemeral-pod.yaml  
kubectl exec -it ephemeral-pod -- cat /data/message.txt  

kubectl delete pod ephemeral-pod  

kubectl apply -f ephemeral-pod.yaml  
kubectl exec -it ephemeral-pod -- cat /data/message.txt  

### ✅ Verification
- Data is lost after Pod deletion  
- Timestamp is different  

---

## 🔹 Task 2: Create PersistentVolume

### Commands
kubectl apply -f pv.yaml  
kubectl get pv  

### ✅ Verification
- STATUS: Available  

---

## 🔹 Task 3: Create PersistentVolumeClaim

### Commands
kubectl apply -f pvc.yaml  
kubectl get pvc  
kubectl get pv  

### ✅ Verification
- STATUS: Bound  
- VOLUME: pv-demo  

---

## 🔹 Task 4: Use PVC in a Pod

### Commands
kubectl apply -f persistent-pod.yaml  
kubectl exec -it persistent-pod -- cat /data/message.txt  

kubectl delete pod persistent-pod  

kubectl apply -f persistent-pod.yaml  
kubectl exec -it persistent-pod -- cat /data/message.txt  

### ✅ Verification
- Data persists after Pod recreation  
- File contains data from both runs  

---

## 🔹 Task 5: StorageClasses

### Commands
kubectl get storageclass  
kubectl describe storageclass  

### ✅ Verification
- Default StorageClass is usually: standard  

---

## 🔹 Task 6: Dynamic Provisioning

### Commands
kubectl apply -f pvc-dynamic.yaml  
kubectl get pvc  
kubectl get pv  

### ✅ Verification
- New PV created automatically  

---

## 🔹 Task 7: Cleanup

### Commands
kubectl delete pod ephemeral-pod  
kubectl delete pod persistent-pod  

kubectl delete pvc pvc-demo pvc-dynamic  
kubectl get pv  

kubectl delete pv pv-demo  

### ✅ Verification
- Dynamic PV deleted automatically  
- Static PV retained (Released state)  

---

## 🏁 Final Outcome

- Demonstrated data loss in ephemeral storage  
- Implemented persistent storage using PV & PVC  
- Verified data persistence across Pod lifecycle  
- Explored static and dynamic provisioning  