# Day 54 – Kubernetes ConfigMaps and Secrets

##  Introduction

Applications need configuration such as:
- Environment variables
- API keys
- Database credentials
- Feature flags

Hardcoding these values inside container images is a bad practice because:
- Requires rebuilding images for every change
- Not secure for sensitive data

 Kubernetes solves this using:
- **ConfigMaps** → for non-sensitive configuration
- **Secrets** → for sensitive data

---

## 🔹 What are ConfigMaps?

ConfigMaps store configuration data in **key-value pairs**.

###  Use Cases:
- Environment variables
- Application settings
- Configuration files

---

## 🔹 What are Secrets?

Secrets store **sensitive information** like:
- Passwords
- API keys
- Tokens

 Values are stored in **base64 encoded format**.

 Important:
Base64 is **encoding, NOT encryption**

---

##  Task 1: ConfigMap from Literals


    kubectl create configmap app-config \
      --from-literal=APP_ENV=production \
      --from-literal=APP_DEBUG=false \
      --from-literal=APP_PORT=8080

 Verification

    kubectl get configmap app-config -o yaml
 
 Output

    data:
      APP_ENV: production
      APP_DEBUG: "false"
      APP_PORT: "8080"

 Stored as plain text

## Task 2: ConfigMap from File


  Nginx Config
    server {
        listen 80;

        location /health {
            return 200 'healthy';
            add_header Content-Type text/plain;
        }
}

### Create ConfigMap

    kubectl create configmap nginx-config --from-file=default.conf=default.conf

### Verification

    kubectl get configmap nginx-config -o yaml

### File content stored inside ConfigMap

## Task 3: Using ConfigMaps in Pods

🔹 Environment Variables

envFrom:
- configMapRef:
 
    name: app-config

 Injects all key-value pairs as environment variables

🔹 Volume Mount (Nginx Config)

volumeMounts:

- name: nginx-config
 
  mountPath: /etc/nginx/conf.d

 Config file mounted inside container

### Verification

    kubectl exec nginx-config-pod -- curl -s http://localhost/health

### Output:

    healthy

## Task 4: Create Secret

    kubectl create secret generic db-credentials \
      --from-literal=DB_USER=admin \
      --from-literal=DB_PASSWORD=s3cureP@ssw0rd

### View Secret

    kubectl get secret db-credentials -o yaml

 Values appear as base64 encoded

### Decode Secret

    kubectl get secret db-credentials -o jsonpath='{.data.DB_PASSWORD}' | base64 --decode

Output:

    s3cureP@ssw0rd
## Task 5: Using Secrets in Pods

🔹 Environment Variable
env:

- name: DB_USER
  valueFrom:
    secretKeyRef:
      name: db-credentials
      key: DB_USER

🔹 Volume Mount
volumes:
- name: secret-volume
  secret:
    secretName: db-credentials

 Each key becomes a file

### Verification
Files contain plain text values

Not base64 encoded inside container

## Task 6: Live Config Updates

### Create ConfigMap

    kubectl create configmap live-config --from-literal=message=hello

Pod reads config continuously

while true; do cat /config/message; sleep 5; done

### Update ConfigMap

    kubectl patch configmap live-config --type merge -p '{"data":{"message":"world"}}'
### Result
hello → world

 Volume-mounted config updates automatically

 Environment variables DO NOT update

## Key Differences

### ConfigMap vs Secret

| Feature   | ConfigMap     | Secret              |
| --------- | ------------- | ------------------- |
| Data type | Non-sensitive | Sensitive           |
| Storage   | Plain text    | Base64 encoded      |
| Security  | Low           | Higher (RBAC, etc.) |



### Env Variables vs Volume Mounts

| Feature      | Env Variables | Volume Mount |
| ------------ | ------------- | ------------ |
| Live updates | ❌ No          | ✅ Yes        |
| Use case     | Simple values | Config files |


## Important Concepts

ConfigMaps = configuration management

Secrets = sensitive data handling

Base64 ≠ encryption

Volume mounts auto-update

Env variables are static at startup

### Cleanup

    kubectl delete pod env-pod nginx-config-pod secret-pod live-pod

    kubectl delete configmap app-config nginx-config live-config

    kubectl delete secret db-credentials

## Key Takeaways
Decoupled configuration from application

Learned secure and flexible config management

Understood real-world DevOps practices

Observed live config updates without restarting pods

## Conclusion

Kubernetes ConfigMaps and Secrets enable:

Dynamic configuration
Better security practices
Scalable application design

This is a core concept used in production systems.