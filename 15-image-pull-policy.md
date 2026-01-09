#Autor: Fagner Geraldes 
#Data de criação: 11/11/2025  
#Data de atualização: 11/11/2025  
#Versão: 0.01  

## Image Pull Policy

### Always

```bash
k3d cluster create meucluster --servers 1 -p "30000:30000@loadbalancer"
kubectl get nodes
kubectl apply -f 15-img-pull-policy-always.yaml && watch 'kubectl get pods'
kubectl describe pod
kubectl get pod -o yaml | grep imagePullPolicy -B 2 -A 1
```

```bash
docker tag fagnerfgb/web-color:green fagnerfgb/web-color:latest
docker push fagnerfgb/web-color:latest
```

```bash
kubectl get pod
kubectl delete $(kubectl get pod -o name) && watch 'kubectl get pods'
kubectl delete -f 15-img-pull-policy-always.yaml
```

### If not present

```bash
docker container run --name web-color -d -p 8181:80 fagnerfgb/web-color:latest
docker container rm -f web-color
```

```bash
kubectl apply -f 15-img-pull-policy-ifnotpresent.yaml && watch 'kubectl get pods'
docker tag fagnerfgb/web-color:blue fagnerfgb/web-color:latest
docker push fagnerfgb/web-color:latest
kubectl apply -f 15-img-pull-policy-ifnotpresent.yaml && watch 'kubectl get pods'
kubectl delete $(kubectl get pod -o name) && watch 'kubectl get pods'
kubectl get pod -o yaml | grep imagePullPolicy -B 2 -A 1
kubectl delete -f 15-img-pull-policy-ifnotpresent.yaml
```

### Never

```bash
docker container run --name web-color -d -p 8181:80 fagnerfgb/web-color:latest
docker container rm -f web-color
```

```bash
kubectl apply -f 15-img-pull-policy-never.yaml && watch 'kubectl get pods'
kubectl get pod -o yaml | grep imagePullPolicy -B 2 -A 1
kubectl delete -f 15-img-pull-policy-never.yaml
k3d cluster delete meucluster
```