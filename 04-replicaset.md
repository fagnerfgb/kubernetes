#Autor: Fagner Geraldes 
#Data de criação: 31/03/2025  
#Data de atualização: 31/03/2025  
#Versão: 0.01  

### Replicaset
### 04-replicaset.yaml
[04-replicaset](04-replicaset.yaml)

### Cenário 1  - Apenas 1 réplica
```bash
k3d cluster create meucluster --servers 3 --agents 3

kubectl apply -f 04-replicaset.yaml

kubectl get pods

kubectl get replicaset

kubectl describe replicaset

kubectl get pods

kubectl describe pods
```

### Cenário 2 - 10 réplicas (Escalabilidade)

```bash
kubectl apply -f 04-replicaset.yaml && watch 'kubectl get rs,po'
```

### Cenário 3 - Resiliência

```bash
kubectl delete $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1)

kubectl get po

kubectl get po -o wide
```

### Trocando imagem - Testando a atualização dos Pods
### O ReplicaSet não atualiza os Pods, para isso, é preciso deletar os pods

```bash
kubectl apply -f 04-replicaset.yaml

kubectl get rs

kubectl describe rs

kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1

kubectl describe $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1)

kubectl port-forward $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1) 8080:80

kubectl delete $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1)

kubectl port-forward $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | tail -n 1) 8080:80

kubectl delete -f 04-replicaset.yaml
```