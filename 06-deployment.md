# Deployment

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 31/03/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Criando um deployment

[Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

### 06-deployment.yaml

[06-deployment](06-deployment.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3
kubectl apply -f 06-deployment.yaml && watch 'kubectl get all'
kubectl describe deploy meudeployment | grep Image:
kubectl describe $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1) | grep Image:
kubectl apply -f 06-deployment2.yaml && watch 'kubectl get all'
kubectl describe deploy meudeployment | grep Image:
kubectl describe $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1) | grep Image:
```

## Rollout

```bash
kubectl get rs
kubectl rollout history deployment meudeployment
kubectl apply -f 06-deployment.yaml && watch 'kubectl get all'
kubectl rollout history deployment meudeployment
kubectl rollout undo deploy meudeployment && watch 'kubectl get all'
kubectl delete -f 06-deployment.yaml
k3d cluster delete meucluster
```
