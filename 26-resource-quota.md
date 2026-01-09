Autor: Fagner Geraldes 
#Data de criação: 23/11/2025  
#Data de atualização: 23/11/2025  
#Versão: 0.01  

## Quotas

### Limitando Recursos

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl apply -f quota.yaml
kubectl get resourcequota
kubectl describe resourcequota recurso-computacional

kubectl apply -f deploy-quota.yaml
kubectl get pod
kubectl delete -f deploy-quota.yaml
kubectl delete -f quota.yaml
```

```bash
kubectl apply -f quota.yaml
kubectl apply -f deploy-quota2.yaml
kubectl get pod
kubectl describe replicaset
kubectl get resourcequota
kubectl describe resourcequota recurso-computacional
kubectl delete -f deploy-quota2.yaml
kubectl delete -f quota.yaml
```

```bash
kubectl apply -f quota.yaml
kubectl apply -f deploy-quota3.yaml
kubectl get pod
kubectl get replicaset
kubectl describe replicaset
kubectl get resourcequota
kubectl describe resourcequota recurso-computacional
kubectl delete -f deploy-quota3.yaml
kubectl delete -f quota.yaml
```

### Limitando Objetos

```bash
kubectl apply -f quota2.yaml
kubectl get resourcequota
kubectl describe resourcequota contador-objetos

kubectl apply -f deploy-quota3.yaml
kubectl get pods
kubectl get replicaset
kubectl describe replicaset

kubectl delete -f deploy-quota3.yaml
kubectl delete -f quota2.yaml
k3d cluster delete meucluster
```