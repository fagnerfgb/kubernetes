#Autor: Fagner Geraldes  
#Data de criação: 19/01/2026  
#Data de atualização: 19/01/2026  
#Versão: 0.01  

### Resiliência e Alta disponibilidade

### Horizontal Pod AutoScaler

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl top nodes # necessita de instalação do metrics server
kubectl apply -f 31-hpa.yaml && watch 'kubectl get pods'
kubectl top pod
watch 'kubectl get hpa,pod'
kubectl delete -f 31-hpa.yaml
```

### Scale Up e Scale Down

```bash
kubectl apply -f 31-hpa2.yaml
watch 'kubectl get hpa,pod'
kubectl delete -f 31-hpa2.yaml
```

### Métricas por container

```bash
kubectl apply -f 31-hpa3.yaml
watch 'kubectl get hpa,pod'
kubectl delete -f 31-hpa2.yaml
k3d cluster delete meucluster
```