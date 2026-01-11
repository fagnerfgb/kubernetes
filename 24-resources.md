Autor: Fagner Geraldes 
#Data de criação: 13/11/2025  
#Data de atualização: 13/11/2025  
#Versão: 0.01  

## Resources

### Metrics Server
```bash
# https://github.com/kubernetes-sigs/metrics-server

# wget https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl apply -f 24-components.yaml
watch 'kubectl get pod -n kube-system'
kubectl top nodes
kubectl top pod
kubectl top pod -n kube-system
```

### Resource Limits - CPU

```bash
# Estrangulamento da aplicação
kubectl apply -f 24-resources-cpu.yaml
watch 'kubectl get pod'
kubectl get all
kubectl get pod -o wide
kubectl describe pod | grep cpu: -B 2 -A 2
watch 'kubectl top nodes'
watch 'kubectl top pod'
kubectl delete -f 24-resources-cpu.yaml
```

### Resource Limits - RAM

```bash
# Aplicação é restartada
kubectl apply -f 24-resources-ram.yaml
watch 'kubectl get pod'
kubectl get pod -o wide
kubectl describe pod | grep memory:  -B 2 -A 2
watch 'kubectl top nodes'
watch 'kubectl top pod'
kubectl delete -f 24-resources-ram.yaml
```

### Resource Requests

```bash
kubectl apply -f 24-resources-requests.yaml
watch 'kubectl get pod'
watch 'kubectl top node'
watch 'kubectl top pod'
kubectl describe pod | grep memory:  -B 2 -A 2
kubectl delete -f 24-resources-requests.yaml
```

```bash
kubectl apply -f 24-resources-requests2.yaml
watch 'kubectl get pod'
watch 'kubectl top node'
watch 'kubectl top pod'
kubectl describe pod | grep memory:  -B 2 -A 2
kubectl delete -f 24-resources-requests2.yaml
```

### QOS

### Guaranteed

```bash
kubectl apply -f 24-qos-guaranteed.yaml
watch 'kubectl get pod'
kubectl describe pod | grep 'QoS Class:'
kubectl delete -f 24-qos-guaranteed.yaml
```

### Burstable

```bash
kubectl apply -f 24-qos-burstable.yaml
kubectl describe pod | grep 'QoS Class:'
kubectl delete -f 24-qos-burstable.yaml
```

### Best Effort

```bash
kubectl apply -f 24-qos-best-effort.yaml
kubectl describe pod | grep 'QoS Class:'
kubectl delete -f 24-qos-best-effort.yaml
k3d cluster delete meucluster
```