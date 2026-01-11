Autor: Fagner Geraldes 
#Data de criação: 23/11/2025  
#Data de atualização: 23/11/2025  
#Versão: 0.01  

## LimitRange

### Valor Padrão

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl apply -f 25-deploy-limit-range.yaml
watch 'kubectl get pod'
kubectl describe pod
kubectl delete -f 25-deploy-limit-range.yaml

kubectl apply -f 25-limit-range.yaml
kubectl apply -f 25-deploy-limit-range.yaml
kubectl describe pod | grep Limits: -A 5
kubectl get limitrange
kubectl describe limitrange valor-padrao
kubectl delete -f 25-deploy-limit-range.yaml
kubectl delete -f 25-limit-range.yaml
```

### Valores Mínimos e Máximos

```bash
kubectl apply -f 25-limit-range2.yaml
kubectl get limitrange
kubectl describe limitrange min-max
kubectl apply -f 25-deploy-limit-range2.yaml
kubectl get pod
kubectl describe pod | grep Limits: -A 5
kubectl delete -f 25-deploy-limit-range2.yaml
kubectl delete -f 25-limit-range2.yaml
```

```bash
kubectl apply -f 25-limit-range2.yaml
kubectl apply -f 25-deploy-limit-range3.yaml
kubectl get pod
kubectl get deploy
kubectl get replicaset
kubectl describe replicaset
kubectl delete -f 25-deploy-limit-range3.yaml
kubectl delete -f 25-limit-range2.yaml
```

```bash
kubectl apply -f 25-limit-range2.yaml
kubectl apply -f 25-deploy-limit-range4.yaml
watch 'kubectl get pod'
kubectl get deploy
kubectl get replicaset
kubectl describe replicaset
kubectl delete -f 25-deploy-limit-range4.yaml
kubectl delete -f 25-limit-range2.yaml
k3d cluster delete meucluster
```