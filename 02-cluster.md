# Criação do cluster

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 28/03/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Criando o primeiro cluster Kubernetes

```bash
k3d cluster create
kubectl cluster-info
kubectl get nodes
cat ~/.kube/config 
docker container ls
k3d cluster list
k3d cluster delete
```

## Criando um cluster Kubernetes sem Loadbalancer

```bash
k3d cluster create fgb-cluster --no-lb
k3d cluster list
docker container ls
kubectl get nodes
k3d cluster delete fgb-cluster
```

## Criando um cluster Kubernetes com 3 Servidores e 3 Agentes

```bash
k3d cluster create fgb-cluster --servers 3 --agents 3
kubectl get nodes
docker container ls
k3d cluster list
k3d cluster delete fgb-cluster
```

## Criando um cluster Kubernetes com bind de porta no Loadbalancer

### 02-cluster.yaml

[02-cluster](02-cluster.yaml)

```bash
k3d cluster create fgb-cluster --servers 3 --agents 3 -p "8080:30000@loadbalancer"
kubectl get nodes
docker container ls
kubectl apply -f 02-cluster.yaml
kubectl get all
k3d cluster delete fgb-cluster
```
