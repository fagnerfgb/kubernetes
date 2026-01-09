#Autor: Fagner Geraldes 
#Data de criação: 27/10/2025  
#Data de atualização: 03/11/2025  
#Versão: 0.02  

### Construindo imagem docker e enviando ao Docker Hub

```bash
docker build -t fagnerfgb/kubenews:v1 .
docker tag fagnerfgb/kubenews:v1 fagnerfgb/kubenews:latest
docker push fagnerfgb/kubenews:v1 && docker push fagnerfgb/kubenews:latest
```

### Criação do Cluster Kubernetes

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
```

### Criação e teste do Banco de Dados PostgreSQL

### deployment.yaml
[deployment](./projetos/kube-news/k8s/deployment.yaml)

```bash
kubectl apply -f ./projetos/kube-news/k8s/deployment.yaml
kubectl port-forward service/postgresql 5432:5432
kubectl delete -f ./projetos/kube-news/k8s/deployment.yaml

### Testar conexão com o dbeaver
```

### Desafio

### deployment-secret.yaml
[deployment-secret](./projetos/kube-news/k8s/deployment-secret.yaml)

```bash./projetos/kube-news/k8s/
echo -n 'kubedevnews' | base64
echo -n 'Pg#123' | base64
echo -n 'postgresql' | base64
# Pegar os valores e preencher os campos dos secrets

kubectl apply -f ./projetos/kube-news/k8s/deployment-secret.yaml && watch 'kubectl get all'
kubectl delete -f ./projetos/kube-news/k8s/deployment-secret.yaml
k3d cluster delete meucluster
```