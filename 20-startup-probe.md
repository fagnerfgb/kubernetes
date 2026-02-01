# Startup Probes

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 12/11/2025  
**Data de atualização:** 01/02/2026  
**Versão:** 0.02  

[Startup Probe](https://kubernetes.io/docs/concepts/configuration/liveness-readiness-startup-probes/)
[Configuring Startup Probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

## Startup Probes HTTP

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl get nodes
kubectl apply -f 20-startup-probe-http.yaml && watch 'kubectl get pods'
kubectl delete -f 20-startup-probe-http.yaml
```

## Startup Probes Exec

```bash
kubectl apply -f 20-startup-probe-exec.yaml && watch 'kubectl get pods,endpoints'
kubectl delete -f 20-startup-probe-exec.yaml
```

## Startup Probes TCP

```bash
kubectl apply -f 20-startup-probe-tcp.yaml && watch 'kubectl get pods'
kubectl delete -f 20-startup-probe-tcp.yaml
k3d cluster delete meucluster
```
