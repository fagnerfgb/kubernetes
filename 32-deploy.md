#Autor: Fagner Geraldes  
#Data de criação: 22/01/2026  
#Data de atualização: 22/01/2026  
#Versão: 0.01  

### Estratégia de deploy de aplicações

### Recreate

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl apply -f 32-deploy-recreate.yaml && watch 'kubectl get pods'
kubectl describe deployment web | grep StrategyType:
kubectl apply -f 32-deploy-recreate.yaml && watch 'kubectl get pods' ### alterei a imagem de blue para green no manifesto
kubectl delete -f 32-deploy-recreate.yaml
```

### Ramped

```bash
kubectl apply -f 32-deploy-ramped.yaml && watch 'kubectl get pods'
kubectl describe deployment web | grep StrategyType:
kubectl apply -f 32-deploy-ramped.yaml && watch 'kubectl get pods' ### alterei a imagem de blue para green no manifesto
kubectl delete -f 32-deploy-ramped.yaml
```

### Blue/Green

```bash
kubectl apply -f 32-deploy-blue-green.yaml && watch 'kubectl get pods'
kubectl apply -f 32-deploy-blue-green.yaml && watch 'kubectl get pods' ### alterei a imagem de blue para green no manifesto
kubectl delete -f 32-deploy-blue-green.yaml
```

### Canary

```bash
kubectl apply -f 32-deploy-canary.yaml && watch 'kubectl get pods'
kubectl apply -f 32-deploy-canary.yaml && watch 'kubectl get pods' ### alterei a quantidade de replicas nos 2 deployments
kubectl delete -f 32-deploy-canary.yaml
k3d cluster delete meucluster
```