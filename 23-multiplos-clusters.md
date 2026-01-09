Autor: Fagner Geraldes 
#Data de criação: 13/11/2025  
#Data de atualização: 13/11/2025  
#Versão: 0.01  

## Múltiplos cluster

### Escolhendo o KubeConfig

```bash
k3d cluster create producao --servers 2 --agents 1 -p "30000:30000@loadbalancer"

k3d cluster create homologacao --servers 2 --agents 1 -p "31000:31000@loadbalancer"

cat  ~/.kube/config

k3d kubeconfig get producao > 23-k8s-prod-kubeconfig.yaml
k3d kubeconfig get homologacao > 23-k8s-homolog-kubeconfig.yaml

kubectl get nodes --kubeconfig ./23-k8s-homolog-kubeconfig.yaml
kubectl get nodes --kubeconfig ./23-k8s-prod-kubeconfig.yaml
```

### Merge do KubeConfig

```bash
KUBECONFIG=./23-k8s-prod-kubeconfig.yaml kubectl get nodes

KUBECONFIG=./23-k8s-prod-kubeconfig.yaml:./23-k8s-homolog-kubeconfig.yaml kubectl config view --flatten

KUBECONFIG=./23-k8s-prod-kubeconfig.yaml:./23-k8s-homolog-kubeconfig.yaml kubectl config view --flatten > 23-merge-config.yaml

cp ./23-merge-config.yaml ~/.kube
```

### kubectl config

```bash
kubectl config
kubectl config get-clusters
kubectl config get-users
kubectl config get-contexts
kubectl config current-context
kubectl config use-context k3d-producao
kubectl config current-context

kubectl create namespace app-abc
kubectl create deployment meudeploy --image nginx -n app-abc
kubectl get deploy
kubectl get deploy -n app-abc
kubectl config set-context --current --namespace app-abc
cat ~/.kube/config | grep namespace -A 3 -B 3
kubectl get nodes
kubectl get deploy
kubectl get deploy -n kube-system
```

### kubectx e kubens

```bash
sudo apt update && sudo apt install kubectx -y

kubectx
kubectx k3d-homologacao
kubectx -


kubens
kubens kube-system
kubectl get deploy
kubens default
kubectl get deploy
kubens -
kubens app-abc
kubectl get deploy

k3d cluster delete producao && k3d cluster delete homologacao
```