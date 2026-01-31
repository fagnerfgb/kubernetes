# Pods

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 30/03/2025  
**Data de atualização:** 31/01/2026  
**Versão:** 0.02  

## Criando Pods

[Pods](https://kubernetes.io/docs/concepts/workloads/pods/)

### 03-pod.yaml

[03-pod](03-pod.yaml)

```bash
k3d cluster create meucluster --servers 3 --agents 3
kubectl api-resources
kubectl apply -f 03-pod.yaml
kubectl get pods
kubectl get all
kubectl get po
kubectl describe pod web-color
kubectl port-forward pod/web-color 8080:80
kubectl get pods -o wide
kubectl delete pod web-color
kubectl get pods
k3d cluster delete meucluster 
```
