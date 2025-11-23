#Autor: Fagner Geraldes 
#Data de criação: 31/03/2025  
#Data de atualização: 31/03/2025  
#Versão: 0.01  

### Deployment
### deployment.yaml
[deployment](deployment.yaml)

```bash
kubectl apply -f deployment.yaml 

kubectl get po

kubectl get all

kubectl describe deploy meudeployment

kubectl apply -f deployment.yaml && watch 'kubectl get po'

kubectl describe deploy meudeployment

kubectl get po

kubectl port-forward pod/meudeployment-54d6d7db5b-4b67n 8080:80
```

### Rollout

```bash
kubectl get rs

kubectl rollout history deployment meudeployment

kubectl apply -f deployment.yaml && watch 'kubectl get deploy,rs,pod'

kubectl rollout history deployment meudeployment

kubectl rollout undo deploy meudeployment && watch 'kubectl get deploy,rs,pod'

kubectl delete -f deployment.yaml

k3d cluster delete meucluster 
```