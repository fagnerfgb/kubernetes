#Autor: Fagner Geraldes 
#Data de criação: 01/04/2025  
#Data de atualização: 01/04/2025  
#Versão: 0.01  

## Services
### ClusterIP
### 07-clusterip.yaml
[clusterip](07-clusterip.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3

kubectl apply -f 07-clusterip.yaml

watch 'kubectl get svc,po'

kubectl run prompt -it --image ubuntu -- /bin/bash
```

```bash
apt update && apt install curl -y

curl http://10.42.3.4

curl http://webcolor

exit
```

```bash
kubectl delete -f 07-clusterip.yaml
```

### NodePort
### 07-nodeport.yaml
[nodeport](07-nodeport.yaml)

```bash
kubectl apply -f 07-nodeport.yaml

kubectl get service

docker inspect k3d-meucluster-agent-0 | grep IPAddress

kubectl get service webcolor

kubectl delete -f 07-nodeport.yaml

k3d cluster delete meucluster
```

### 07-nodeport1.yaml
[nodeport1](07-nodeport1.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl get no

docker container ls

kubectl apply -f 07-nodeport1.yaml

kubectl run prompt --rm -it --image ubuntu -- /bin/bash
```

```bash
apt update && apt install curl -y

curl webcolor

exit
```

```bash
kubectl delete -f 07-nodeport1.yaml
k3d cluster delete meucluster
```