#Autor: Fagner Geraldes 
#Data de criação: 15/10/2025  
#Data de atualização: 15/10/2025  
#Versão: 0.01  

## Env

```bash
k3d cluster create fgb-cluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
```
```bash
kubectl apply -f env.yaml
watch 'kubectl get pods'
```

## ConfigMap

```bash
kubectl get configmap
```

### Linha de comando

```bash
kubectl create configmap app-config --from-literal=APP_NAME="Aplicacao ConfigMap"
kubectl get configmap
kubectl describe configmap app-config
kubectl delete configmap app-config
```

```bash
echo "Fagner Geraldes Braga" > arquivo.config
kubectl create configmap app-config --from-literal=APP_NAME="App de Teste" --from-literal=APP_VERSION="4.0" --from-file arquivo.config
kubectl delete configmap app-config
```

### Manifesto

```bash
kubectl apply -f configmap.yaml
kubectl get configmap
kubectl describe configmap app-config
kubectl delete configmap app-config
```

### ConfigMap definido por referência
```bash
kubectl apply -f configmap.yaml
kubectl apply -f deploy-configmap-referencia.yaml
kubectl delete -f deploy-configmap-referencia.yaml
kubectl delete configmap app-config
```

### ConfigMap definido por valor
```bash
kubectl apply -f configmap-valor.yaml
kubectl apply -f deploy-configmap-valor.yaml

kubectl delete -f deploy-configmap-valor.yaml
kubectl delete configmap app-config
```

### Secrets
```bash
kubectl get secrets
kubectl create secret generic app-secret --from-literal=APP_NAME="Minha Aplicacao 2.0" --from-literal=APP_VERSION="5.0"
kubectl get secrets
kubectl describe secret app-secret
kubectl get secret -o yaml
echo "TWluaGEgQXBsaWNhY2FvIDIuMA==" | base64 -d
kubectl delete secret app-secret
```

```bash
echo -n "Aplicacao Secret" | base64
echo -n "Versao 7.0" | base64
echo -n "FGB" | base64
kubectl apply -f secret.yaml
kubectl get secrets
kubectl describe secret app-secret
kubectl delete secret app-secret
```

### Secret definido por referência
```bash
kubectl apply -f secret.yaml
kubectl apply -f deploy-secret-referencia.yaml
kubectl delete -f deploy-secret-referencia.yaml
kubectl delete secret app-secret
```

### Secret definido por valor
```bash
kubectl apply -f secret-valor.yaml
kubectl apply -f deploy-secret-valor.yaml
kubectl delete -f deploy-secret-valor.yaml
kubectl delete secret app-secret
```

```bash
k3d cluster delete fgb-cluster
```