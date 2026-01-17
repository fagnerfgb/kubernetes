Autor: Fagner Geraldes 
#Data de criação: 14/01/2026  
#Data de atualização: 14/01/2026  
#Versão: 0.01  

### Configuração do Ingress Controller

### Ambiente Local

```bash
kind create cluster --name meucluster --config 28-ingress-controller.yaml
kubectl apply -f 28-nginx.yaml
watch 'kubectl get all -n ingress-nginx'
kubectl delete -f 28-nginx.yaml
kind delete cluster --name meucluster
```

### Nuvem (Digital Ocean)

```bash
# https://kubernetes.github.io/ingress-nginx/
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.14.1/deploy/static/provider/do/deploy.yaml
kubectl get ns
kubectl get ingress-nginx
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.14.1/deploy/static/provider/do/deploy.yaml
```

### Ingress Simples

```bash
kind create cluster --name meucluster --config 28-ingress-controller.yaml
kubectl apply -f 28-nginx.yaml
watch 'kubectl get all -n ingress-nginx'
kubectl apply -f 28-apps.yaml
kubectl get ingressclass
kubectl apply -f 28-ingress.yaml
kubectl get ingress
kubectl delete -f .
```

### Ingress baseado em path

```bash
kind create cluster --name meucluster --config 28-ingress-controller.yaml
kubectl apply -f 28-nginx.yaml
watch 'kubectl get all -n ingress-nginx'
kubectl apply -f 28-apps.yaml
kubectl get ingressclass
kubectl apply -f 28-ingress2.yaml
kubectl get ingress
kubectl delete -f .
kind delete cluster --name meucluster
```

### Default Backend

```bash
kind create cluster --name meucluster --config 28-ingress-controller.yaml
kubectl apply -f 28-nginx.yaml
watch 'kubectl get all -n ingress-nginx'
kubectl apply -f 28-apps2.yaml
kubectl get ingressclass
kubectl apply -f 28-ingress3.yaml
kubectl get ingress
kubectl delete -f .
kind delete cluster --name meucluster
```

### Ingress baseado em domínio

```bash
kind create cluster --name meucluster --config 28-ingress-controller.yaml
kubectl apply -f 28-nginx.yaml
watch 'kubectl get all -n ingress-nginx'
kubectl apply -f 28-apps2.yaml
kubectl get ingressclass
kubectl apply -f 28-ingress4.yaml
kubectl get ingress
kubectl delete -f .
kind delete cluster --name meucluster
```