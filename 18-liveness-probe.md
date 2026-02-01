# Liveness Probes

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 11/11/2025  
**Data de atualização:** 01/02/2026  
**Versão:** 0.02  

[Liveness Probe](https://kubernetes.io/docs/concepts/configuration/liveness-readiness-startup-probes/)
[Configuring Liveness Probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

## Liveness Probes HTTP

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer" && watch 'kubectl get nodes'
kubectl apply -f 18-liveness-probe-http.yaml && watch 'kubectl get pods'
kubectl delete -f 18-liveness-probe-http.yaml
```

## Liveness Probes Exec

```bash
kubectl apply -f 18-liveness-probe-exec.yaml && watch 'kubectl get pods'
kubectl delete $(kubectl get pod -o name) && watch 'kubectl get pods'
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
rm /tmp/health
exit
```

```bash
watch 'kubectl get pods'
kubectl delete -f 18-liveness-probe-exec.yaml
```

## Liveness Probes TCP

```bash
kubectl apply -f 18-liveness-probe-tcp.yaml && watch 'kubectl get pods'
kubectl delete -f 18-liveness-probe-tcp.yaml
k3d cluster delete meucluster
```
