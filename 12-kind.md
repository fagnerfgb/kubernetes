#Autor: Fagner Geraldes 
#Data de criação: 11/10/2025  
#Data de atualização: 11/10/2025  
#Versão: 0.01  

## Instalação

```bash
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-$(uname)-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-$(uname)-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

### Criando um cluster Simples
```bash
kind create cluster
kubectl get nodes
kind get clusters
kind create cluster --name meucluster
kind get clusters
kind delete cluster
kind delete cluster --name meucluster
```

### Criando um cluster com arquivo de configuração
```bash
kind create cluster --name meucluster --config 12-kind-config.yaml
kubectl get nodes
kind get clusters
kubectl apply -f ./projetos/celsius-farenheit/k8s/deployment.yaml
kubectl port-forward service/conversaotemperatura 8080:80
kind delete cluster --name meucluster
```

### Criando um cluster com HA
```bash
kind create cluster --name meucluster --config 12-kind-config2.yaml
kubectl get nodes
kubectl apply -f ./projetos/celsius-farenheit/k8s/deployment.yaml
kubectl port-forward service/conversaotemperatura 8080:80
kind delete cluster --name meucluster
```

### Criando um cluster com HA e Bind de porta
```bash
kind create cluster --name meucluster --config 12-kind-config3.yaml
kubectl get nodes
kubectl apply -f ./projetos/celsius-farenheit/k8s/deployment.yaml
kind delete cluster --name meucluster
```

### Definindo a versão do cluster Kubernetes

https://github.com/kubernetes-sigs/kind/releases

```bash
kind --version
kind create cluster --name meucluster --config 12-kind-config4.yaml
kubectl get nodes
kubectl apply -f ./projetos/celsius-farenheit/k8s/deployment.yaml
kind delete cluster --name meucluster
```

### Definindo o tipo do CNI

```bash
kind create cluster --name meucluster --config 12-kind-config5.yaml
kubectl get nodes
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.4/manifests/calico.yaml
kubectl get nodes
kubectl apply -f ./projetos/celsius-farenheit/k8s/deployment.yaml
kind delete cluster --name meucluster
```

### Pegando imagem local e colocando no cluster

```bash
kind create cluster --name meucluster --config 12-kind-config5.yaml
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.4/manifests/calico.yaml
kubectl get nodes
kind load --name meucluster docker-image fagnerfgb/temperatura-kind:v1
kubectl apply -f ./projetos/celsius-farenheit/k8s/deployment-local-image.yaml
kind delete cluster --name meucluster
```