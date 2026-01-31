# Labels & Selectors

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 30/03/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Labels e Selectors

[Labels e Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)

### 05-labels-selector.yaml

[05-labels-selector](05-labels-selector.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3
kubectl apply -f 05-labels-selector.yaml && watch 'kubectl get pods'
kubectl get pods -l app=web
kubectl get pods -l versao=blue
kubectl get pods -l versao=green
kubectl delete -f 05-labels-selector.yaml
k3d cluster delete meucluster 
```
