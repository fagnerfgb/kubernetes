# Replicaset

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 30/03/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Criando o Replicaset

[Replicaset](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)

### 04-replicaset.yaml

[04-replicaset](04-replicaset.yaml)

## Cenário 1  - Apenas 1 réplica

```bash
k3d cluster create meucluster --servers 3 --agents 3

kubectl apply -f 04-replicaset.yaml && watch 'kubectl get rs,po'
kubectl describe rs,po
```

## Cenário 2 - 10 réplicas (Escalabilidade)

```bash
kubectl apply -f 04-replicaset2.yaml && watch 'kubectl get rs,po'
```

## Cenário 3 - Resiliência

```bash
kubectl delete $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1) && watch 'kubectl get rs,po'
kubectl get po -o wide
```

## Trocando imagem - Testando a atualização dos Pods - O ReplicaSet não atualiza os Pods, para isso, é preciso deletar os pods

```bash

kubectl describe pod | grep Image:
kubectl apply -f 04-replicaset3.yaml && watch 'kubectl get rs,po'
kubectl describe rs
kubectl describe pod | grep Image:
kubectl describe $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1) | grep Image:
kubectl delete $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1)
kubectl describe $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | tail -n 1) | grep Image:
kubectl delete -f 04-replicaset3.yaml
k3d cluster delete meucluster 
```
