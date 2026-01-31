# Variáveis de Ambiente

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 15/10/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Env

```bash
k3d cluster create fgb-cluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl apply -f 13-env.yaml && watch 'kubectl get all'
```

## ConfigMap

### Linha de comando

```bash
kubectl get configmap
kubectl create configmap app-config --from-literal=APP_NAME="Aplicação ConfigMap"
kubectl get configmap
kubectl describe configmap app-config
kubectl delete configmap app-config
```

```bash
echo "Fagner Geraldes Braga" > 13-arquivo.config
kubectl create configmap app-config --from-literal=APP_NAME="App de Teste" --from-literal=APP_VERSION="4.0" --from-file 13-arquivo.config
kubectl describe configmap app-config
kubectl delete configmap app-config
```

### Manifesto

```bash
kubectl apply -f 13-configmap.yaml
kubectl get configmap
kubectl describe configmap app-config
kubectl delete configmap app-config
```

### ConfigMap definido por referência

```bash
kubectl apply -f 13-configmap.yaml
kubectl apply -f 13-deploy-configmap-referencia.yaml && watch 'kubectl get all'
kubectl delete -f 13-deploy-configmap-referencia.yaml
kubectl delete configmap app-config
```

### ConfigMap definido por valor

```bash
kubectl apply -f 13-configmap-valor.yaml
kubectl apply -f 13-deploy-configmap-valor.yaml && watch 'kubectl get all'
kubectl delete -f 13-deploy-configmap-valor.yaml
kubectl delete configmap app-config
```

## Secrets

```bash
kubectl get secrets
kubectl create secret generic app-secret --from-literal=APP_NAME="Minha Aplicação 2.0" --from-literal=APP_VERSION="5.0"
kubectl get secrets
kubectl describe secret app-secret
kubectl get secret -o yaml
echo "TWluaGEgQXBsaWNhY2FvIDIuMA==" | base64 -d
kubectl delete secret app-secret
```

```bash
echo -n "Aplicação Secret" | base64
echo -n "Versao 7.0" | base64
echo -n "FGB" | base64
kubectl apply -f 13-secret.yaml
kubectl get secrets
kubectl describe secret app-secret
kubectl delete secret app-secret
```

### Secret definido por referência

```bash
kubectl apply -f 13-secret.yaml 
kubectl apply -f 13-deploy-secret-referencia.yaml && watch 'kubectl get all'
kubectl delete -f 13-deploy-secret-referencia.yaml
kubectl delete secret app-secret
```

### Secret definido por valor

```bash
kubectl apply -f 13-secret-valor.yaml
kubectl apply -f 13-deploy-secret-valor.yaml && watch 'kubectl get all'
kubectl delete -f 13-deploy-secret-valor.yaml
kubectl delete secret app-secret
k3d cluster delete fgb-cluster
```
