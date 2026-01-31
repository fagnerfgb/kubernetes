# Services

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 01/04/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

[Service](https://kubernetes.io/docs/concepts/services-networking/service/)

## ClusterIP

### 07-clusterip.yaml

[clusterip](07-clusterip.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3
kubectl apply -f 07-clusterip.yaml && watch 'kubectl get all'
kubectl get svc

IP=$(kubectl get service webcolor -o wide | awk 'NR>1 {print $3}')
URL="http://${IP}"
echo "$URL"

kubectl run curl -it --rm --image fabricioveronez/ubuntu-curl -- /bin/bash
```

```bash
# colar valor da variável URL
curl 
curl http://webcolor
exit
```

```bash
kubectl delete -f 07-clusterip.yaml
```

## NodePort

### 07-nodeport.yaml

[nodeport](07-nodeport.yaml)

```bash
kubectl apply -f 07-nodeport.yaml && watch 'kubectl get all'
IP=$(kubectl get node k3d-meucluster-agent-0 -o wide | awk 'NR>1 {print $6}')
PORT=$(kubectl get service webcolor -o jsonpath='{.spec.ports[0].nodePort}')
URL="http://${IP}:${PORT}"
echo "$URL"
kubectl delete -f 07-nodeport.yaml
k3d cluster delete meucluster
```

### 07-nodeport1.yaml

[nodeport1](07-nodeport1.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl get no
docker container ls
kubectl apply -f 07-nodeport1.yaml && watch 'kubectl get all'
kubectl run curl -it --rm --image fabricioveronez/ubuntu-curl -- /bin/bash
```

```bash
curl webcolor
exit
```

```bash
kubectl delete -f 07-nodeport1.yaml
k3d cluster delete meucluster
```
