# Kube-News

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 27/10/2025  
**Data de atualização:** 01/02/2026  
**Versão:** 0.03  

## Construindo imagem docker e enviando ao Docker Hub

```bash
docker build -t fagnerfgb/kubenews:v1 .
docker tag fagnerfgb/kubenews:v1 fagnerfgb/kubenews:latest
docker push fagnerfgb/kubenews:v1 && docker push fagnerfgb/kubenews:latest
```

## Criação do Cluster Kubernetes

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
```

## Criação e teste do Banco de Dados PostgreSQL

### deployment.yaml

[deployment](./projetos/kube-news/k8s/deployment.yaml)

```bash
kubectl apply -f ./projetos/kube-news/k8s/deployment.yaml && watch 'kubectl get all'
kubectl port-forward service/postgresql 5432:5432
kubectl delete -f ./projetos/kube-news/k8s/deployment.yaml
### Testar conexão com o dbeaver
```

## Desafio

### deployment-secret.yaml

[deployment-secret](./projetos/kube-news/k8s/deployment-secret.yaml)

```bash
echo -n 'kubedevnews' | base64
echo -n 'Pg#123' | base64
echo -n 'postgresql' | base64
# Pegar os valores e preencher os campos dos secrets

kubectl apply -f ./projetos/kube-news/k8s/deployment-secret.yaml && watch 'kubectl get all'
kubectl delete -f ./projetos/kube-news/k8s/deployment-secret.yaml
k3d cluster delete meucluster
```
