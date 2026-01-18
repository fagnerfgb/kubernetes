#Autor: Fagner Geraldes 
#Data de criação: 17/01/2026  
#Data de atualização: 17/01/2026  
#Versão: 0.01  

### Ciclo de vida do Pod e dos containers

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl apply -f 29-nginx.yaml && watch 'kubectl get pod'
kubectl describe $(kubectl get pod -o name) | grep Events: -A 1000
kubectl describe $(kubectl get pod -o name) | grep State
kubectl get pod -o yaml | grep conditions: -A 25
kubectl delete -f 29-nginx.yaml
```

```bash
kubectl apply -f 29-signs.yaml && watch 'kubectl get pod'
kubectl delete $(kubectl get pod -o name) 
watch 'kubectl get pod'
kubectl delete -f 29-signs.yaml

kubectl apply -f 29-signs2.yaml && watch 'kubectl get pod'
kubectl delete $(kubectl get pod -o name)
watch 'kubectl get pod'
kubectl delete -f 29-signs2.yaml
```

### Post Start e Pré Stop


```bash
# https://webhook.site/
kubectl apply -f 29-webhook.yaml && watch 'kubectl get pod'
kubectl delete $(kubectl get pod -o name)
kubectl delete -f 29-webhook.yaml
```

### Init Container

```bash
kubectl apply -f 29-inicial.yaml
kubectl apply -f 29-init-container.yaml && watch 'kubectl get pod'
kubectl get $(kubectl get pod -o name | grep nginx) -o yaml | grep initContainerStatuses: -A 20
kubectl delete -f "29-ini*.yaml"
k3d cluster delete meucluster
```