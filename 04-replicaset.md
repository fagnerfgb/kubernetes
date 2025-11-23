#Autor: Fagner Geraldes 
#Data de criação: 31/03/2025  
#Data de atualização: 31/03/2025  
#Versão: 0.01  

### Replicaset
### replicaset.yaml
[replicaset](replicaset.yaml)

### Cenário 1  - Apenas 1 réplica
```bash
k3d cluster create meucluster --servers 3 --agents 3

kubectl apply -f replicaset.yaml

kubectl get pods

kubectl get replicaset

kubectl describe replicaset

kubectl get pods

kubectl describe pods
```

### Cenário 2 - 10 réplicas (Escalabilidade)

```bash
kubectl apply -f replicaset.yaml && watch 'kubectl get rs,po'
```

### Cenário 3 - Resiliência

```bash
kubectl delete pod/meureplicaset-b4dpj

kubectl get po

kubectl get po -o wide
```

### Trocando imagem - Testando a atualização dos Pods
### O ReplicaSet não atualiza os Pods, para isso, é preciso deletar os pods

```bash
kubectl apply -f replicaset.yaml

kubectl get rs

kubectl describe rs

kubectl get po

kubectl get pod/meureplicaset-dhbgw 

kubectl describe pod/meureplicaset-dhbgw 

kubectl delete pod/meureplicaset-dhbgw 

kubectl get po

kubectl describe pod/meureplicaset-cn4qg

kubectl port-forward pod/meureplicaset-cn4qg 8080:80

kubectl delete -f replicaset.yaml
```