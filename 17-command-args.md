# Commands e Args

**Autor:** Fagner Geraldes Braga  
**Data de criação:** 11/11/2025  
**Data de atualização:** 01/02/2026  
**Versão:** 0.02  

[Commands e Args](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/)

```bash
docker container run --entrypoint echo ubuntu "Hello World"
k3d cluster create meucluster --servers 1 -p "30000:30000@loadbalancer"
kubectl apply -f 17-command-e-args.yaml && watch 'kubectl get all'
kubectl logs exec
kubectl delete -f 17-command-e-args.yaml
```

```bash
kubectl apply -f 17-command-e-args2.yaml && watch 'kubectl get all'
kubectl exec -it exec -- /bin/sh
```

```bash
ls /tmp
exit
```

```bash
kubectl delete -f 17-command-e-args2.yaml
k3d cluster delete meucluster
```
