#Autor: Fagner Geraldes 
#Data de criação: 23/11/2025  
#Data de atualização: 23/11/2025  
#Versão: 0.01  

## Quotas

### Limitando Recursos

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl apply -f 26-quota.yaml
kubectl get resourcequota
kubectl describe resourcequota recurso-computacional

kubectl apply -f 26-deploy-quota.yaml
kubectl get pod
kubectl describe resourcequota recurso-computacional
kubectl delete -f 26-deploy-quota.yaml
kubectl delete -f 26-quota.yaml
```

```bash
kubectl apply -f 26-quota.yaml
kubectl apply -f 26-deploy-quota2.yaml
kubectl get pod
kubectl describe replicaset
kubectl get resourcequota
kubectl describe resourcequota recurso-computacional
kubectl delete -f 26-deploy-quota2.yaml
kubectl delete -f 26-quota.yaml
```

```bash
kubectl apply -f 26-quota.yaml
kubectl apply -f 26-deploy-quota3.yaml
kubectl get pod
kubectl get replicaset
kubectl describe replicaset
kubectl get resourcequota
kubectl describe resourcequota recurso-computacional
kubectl delete -f 26-deploy-quota3.yaml
kubectl delete -f 26-quota.yaml
```

### Limitando Objetos

```bash
kubectl apply -f 26-quota2.yaml
kubectl get resourcequota
kubectl describe resourcequota contador-objetos

kubectl apply -f 26-deploy-quota3.yaml
kubectl get pods
kubectl get replicaset
kubectl describe replicaset
kubectl describe resourcequota contador-objetos

kubectl delete -f 26-deploy-quota3.yaml
kubectl delete -f 26-quota2.yaml
k3d cluster delete meucluster
```