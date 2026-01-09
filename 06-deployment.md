#Autor: Fagner Geraldes 
#Data de criação: 31/03/2025  
#Data de atualização: 31/03/2025  
#Versão: 0.01  

### Deployment
### 06-deployment.yaml
[06-deployment](06-deployment.yaml)

```bash
kubectl apply -f 06-deployment.yaml

kubectl get po

kubectl get all

kubectl describe deploy meudeployment | grep Image

kubectl port-forward $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1) 8080:80

kubectl apply -f 06-deployment.yaml && watch 'kubectl get po'

kubectl describe deploy meudeployment | grep Image

kubectl port-forward $(kubectl get pods --sort-by=.metadata.creationTimestamp -o name | head -n 1) 8080:80
```

### Rollout

```bash
kubectl get rs

kubectl rollout history deployment meudeployment

kubectl apply -f 06-deployment.yaml && watch 'kubectl get deploy,rs,pod'

kubectl rollout history deployment meudeployment

kubectl rollout undo deploy meudeployment && watch 'kubectl get deploy,rs,pod'

kubectl delete -f 06-deployment.yaml

k3d cluster delete meucluster
```