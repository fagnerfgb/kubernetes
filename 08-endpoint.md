# Endpoint

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 02/04/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Criando um endpoint

[Endpoint Slice](https://kubernetes.io/docs/concepts/services-networking/endpoint-slices/)

### 08-endpoint.yaml

[endpoint](08-endpoint.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl apply -f 08-endpoint.yaml && watch 'kubectl get rs,svc,endpoints,endpointslice'
```

```bash
kubectl delete -f 08-endpoint.yaml
k3d cluster delete meucluster
```
