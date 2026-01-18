#Autor: Fagner Geraldes 
#Data de criação: 13/11/2025  
#Data de atualização: 13/11/2025  
#Versão: 0.01  

## Namespaces

### Criação

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl get namespace
kubectl get all -n kube-system
kubectl create namespace producao
kubectl get namespace
kubectl apply -f 22-namespace.yaml
kubectl get namespace
```

### Criando objetos

```bash
kubectl apply -f 22-namespace-obj.yaml
kubectl get all
kubectl get all -o wide
kubectl get all -n default
kubectl get all -n producao
kubectl delete -f 22-namespace-obj.yaml
```

```bash
kubectl apply -f 22-namespace-obj.yaml -n producao
kubectl get pod -n producao
kubectl get all -n producao
kubectl port-forward service/web 8080:80 -n producao
```

```bash
kubectl apply -f 22-namespace-obj-dec.yaml
kubectl get all
kubectl get pod -n homologacao
kubectl get all -n homologacao
kubectl port-forward service/web 8181:80 -n homologacao
kubectl delete namespace homologacao
```

### Comunicação entre namespaces (DNS)
```bash
kubectl run curl --rm -it --image ubuntu -- /bin/bash
apt update && apt install curl -y
curl http://web
curl http://web.producao.svc.cluster.local
```

```bash
kubectl get pods -n kube-system
kubectl get pod -A
kubectl apply -f 22-external-service.yaml
kubectl get service
```

```bash
curl http://web
exit
```

```bash
kubectl api-resources
kubectl get po -n producao
kubectl get po --all-namespaces
kubectl get po -A
kubectl delete namespace producao
kubectl delete -f 22-external-service.yaml
kubectl get all
k3d cluster delete meucluster
```