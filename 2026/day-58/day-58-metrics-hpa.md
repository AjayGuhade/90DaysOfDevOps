# ⚙️ What is Metrics Server?

The **Metrics Server** is a cluster-wide aggregator of resource usage data.

## Why it is needed:
- Provides CPU & memory usage metrics
- Required for `kubectl top`
- Required by HPA to make scaling decisions

## Verification:


    kubectl top nodes
    kubectl top pods -A

## Exploring Metrics
Commands used:

    kubectl top nodes
    kubectl top pods -A
    kubectl top pods -A --sort-by=cpu
Key Insight:

kubectl top → shows actual usage

Requests/Limits → configured values (not real-time)

## Deployment with CPU Requests

Created a CPU-intensive app using php-apache image.

Deployment YAML:

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: php-apache
    spec:
      replicas: 1
      selector:
        matchLabels:
          app: php-apache
      template:
        metadata:
          labels:
            app: php-apache
        spec:
          containers:
          - name: php-apache
            image: registry.k8s.io/hpa-example
            ports:
            - containerPort: 80
            resources:
              requests:
                cpu: 200m

Expose Service:

    kubectl expose deployment php-apache --port=80

## Horizontal Pod Autoscaler (Imperative)

Create HPA:

    kubectl autoscale deployment php-apache \
      --cpu-percent=50 \
      --min=1 \
      --max=10
Check:

    kubectl get hpa
    kubectl describe hpa php-apache

Key Observation:

  TARGETS initially shows <unknown>

After ~30 sec → shows CPU utilization %

## Load Testing

Generate Load:

    kubectl run load-generator \
      --image=busybox:1.36 \
      --restart=Never \
      -- /bin/sh -c "while true; do wget -q -O- http://php-apache; done"

Watch Autoscaling:

     kubectl get hpa php-apache --watch

Result:

- CPU usage increased above 50%
- Pods scaled from 1 → multiple replicas
- After stopping load → gradual scale down

## How HPA Works

Formula:

    desiredReplicas = ceil(currentReplicas * (currentUsage / targetUsage))

Example:

- Current Pods = 2
- CPU Usage = 80%
- Target = 50%
- desiredReplicas = ceil(2 * (80/50)) = 4

## autoscaling/v1 vs autoscaling/v2

| Feature          | v1       | v2                  |
| ---------------- | -------- | ------------------- |
| Metrics          | CPU only | CPU, Memory, Custom |
| Scaling Behavior | Basic    | Advanced control    |
| Flexibility      | Low      | High                |

## Declarative HPA (YAML)

    apiVersion: autoscaling/v2
    kind: HorizontalPodAutoscaler
    metadata:
      name: php-apache
    spec:
      scaleTargetRef:
        apiVersion: apps/v1
        kind: Deployment
        name: php-apache
      minReplicas: 1
      maxReplicas: 10
      metrics:
      - type: Resource
        resource:
          name: cpu
          target:
            type: Utilization
            averageUtilization: 50
      behavior:
        scaleUp:
          stabilizationWindowSeconds: 0
        scaleDown:
          stabilizationWindowSeconds: 300

## Behavior Section Explained

The behavior section controls scaling speed:

scaleUp

   Fast scaling (no delay)

scaleDown

   Slow scaling (300 seconds)

Prevents rapid fluctuations

## Cleanup

    kubectl delete hpa php-apache
    kubectl delete svc php-apache
    kubectl delete deployment php-apache
    kubectl delete pod load-generator

Scaling event (replicas increasing)

## Key Learnings

- Metrics Server is required for HPA
- HPA depends on CPU requests
- Scaling is based on actual usage, not limits
- autoscaling/v2 provides advanced scaling control
- Scale-up is fast, scale-down is intentionally slow

## Conclusion

Today I implemented real-world auto-scaling in Kubernetes.

Observed:

- App scaling up under load 📈
- Stabilizing performance ⚖️
- Scaling down when idle 📉

This is exactly how production systems handle traffic spikes.