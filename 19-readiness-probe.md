#Autor: Fagner Geraldes 
#Data de criação: 12/11/2025  
#Data de atualização: 12/11/2025  
#Versão: 0.01  

## Readiness Probes

### Readiness Probes HTTP

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl get nodes
kubectl apply -f 19-readiness-probe-http.yaml && watch 'kubectl get pods,endpoints'
kubectl delete -f 19-readiness-probe-http.yaml
```

### Readiness Probes Exec

```bash
kubectl apply -f 19-readiness-probe-exec.yaml && watch 'kubectl get pods,endpoints'
kubectl delete -f 19-readiness-probe-exec.yaml
```

### Readiness Probes TCP

```bash
kubectl apply -f 19-readiness-probe-tcp.yaml && watch 'kubectl get pods'
kubectl delete -f 19-readiness-probe-tcp.yaml
k3d cluster delete meucluster
```