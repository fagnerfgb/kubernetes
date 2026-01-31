# Endpoint

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 02/04/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Criando um endpoint

### 08-endpoint.yaml

[endpoint](08-endpoint.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl apply -f 08-endpoint.yaml

kubectl get po

kubectl get svc

kubectl get endpoints

kubectl get pods -o wide

kubectl get endpointslice
```

```bash
kubectl delete -f 08-endpoint.yaml
k3d cluster delete meucluster
```
