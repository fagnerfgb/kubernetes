# Restart Policy

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 11/11/2025  
**Data de atualização:** 01/02/2026  
**Versão:** 0.02  

[Restart Policy](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy)

## Always

```bash
k3d cluster create meucluster --servers 1 -p "30000:30000@loadbalancer"
kubectl get nodes
kubectl apply -f 16-restart-policy-always.yaml && watch 'kubectl get pods'
kubectl describe pod
kubectl get pod -o yaml | grep restartPolicy -B 2 -A 1
watch 'kubectl get pod'
kubectl delete -f 16-restart-policy-always.yaml
```

## On Failure

```bash
kubectl apply -f 16-restart-policy-onfailure.yaml && watch 'kubectl get pods'
kubectl get pod -o yaml | grep restartPolicy: -B 2 -A 1
watch 'kubectl get pod'
kubectl delete -f 16-restart-policy-onfailure.yaml
```

## Never

```bash
kubectl apply -f 16-restart-policy-never.yaml && watch 'kubectl get pods'
kubectl get pod -o yaml | grep restartPolicy: -B 2 -A 1
watch 'kubectl get pod'
kubectl delete -f 16-restart-policy-never.yaml
k3d cluster delete meucluster
```
