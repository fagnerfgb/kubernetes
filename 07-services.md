#Autor: Fagner Geraldes 
#Data de criação: 01/04/2025  
#Data de atualização: 01/04/2025  
#Versão: 0.01  

## Services
### ClusterIP
### clusterip.yaml
[clusterip](clusterip.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3

kubectl apply -f clusterip.yaml

kubectl get po

kubectl get service

kubectl get po

kubectl run prompt -it --image ubuntu -- /bin/bash
```

```bash
apt update && apt install curl -y

curl http://10.42.3.4

curl http://webcolor

exit
```

```bash
kubectl delete -f clusterip.yaml
```

### NodePort
### nodeport.yaml
[nodeport](nodeport.yaml)

```bash
kubectl apply -f nodeport.yaml 

kubectl get service

docker container ls

docker inspect 61eb30cd6216 

kubectl get service

kubectl delete -f nodeport.yaml

k3d cluster delete meucluster
```

### nodeport1.yaml
[nodeport1](nodeport1.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl get no

docker container ls

kubectl apply -f nodeport1.yaml

kubectl run prompt --rm -it --image ubuntu -- /bin/bash
```

```bash
apt update && apt install curl -y

curl webcolor

exit
```

```bash
kubectl delete -f nodeport1.yaml
k3d cluster delete meucluster
```