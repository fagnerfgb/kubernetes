#Autor: Fagner Geraldes 
#Data de criação: 11/11/2025  
#Data de atualização: 11/11/2025  
#Versão: 0.01  

## Liveness Probes

### Liveness Probes HTTP

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer" && watch 'kubectl get nodes'
kubectl apply -f liveness-probe-http.yaml && watch 'kubectl get pods'
kubectl delete -f liveness-probe-http.yaml
```

### Liveness Probes Exec

```bash
kubectl apply -f liveness-probe-exec.yaml && watch 'kubectl get pods'
kubectl exec -it simulador-do-caos-7bf4ddd54b-h869f -- /bin/sh
```

```bash
rm /tmp/health
exit
```

```bash
watch 'kubectl get pods'
kubectl delete -f liveness-probe-exec.yaml
```

### Liveness Probes TCP

```bash
kubectl apply -f liveness-probe-tcp.yaml && watch 'kubectl get pods'
kubectl delete -f liveness-probe-tcp.yaml
k3d cluster delete meucluster
```