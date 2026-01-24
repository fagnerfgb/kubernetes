#Autor: Fagner Geraldes  
#Data de criação: 23/01/2026  
#Data de atualização: 23/01/2026  
#Versão: 0.01  

### Segurança

### Security Context - Definição de usuário e grupo

``` bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl apply -f 33-security-context-pod.yaml && watch 'kubectl get pods'
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
whoami
cat /etc/passwd
exit
```

```bash
kubectl apply -f 33-security-context-pod.yaml && watch 'kubectl get pods'
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
whoami
exit
```

```bash
kubectl delete -f 33-security-context-pod.yaml
kubectl apply -f 33-security-context-container.yaml && watch 'kubectl get pods'
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
whoami
exit
```

```bash
kubectl delete -f 33-security-context-container.yaml
```

### Security Context - Tratando volume e file system

```bash
kubectl apply -f 33-security-context-volume.yaml && watch 'kubectl get pods'
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
ls / -lha
exit
```

```bash
kubectl apply -f 33-security-context-volume.yaml && watch 'kubectl get pods'
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
ls / -lha
exit
```

```bash
kubectl delete -f 33-security-context-volume.yaml
```

### Security Context - Linux Capabilities

```bash
kubectl apply -f 33-security-context-capabilities.yaml && watch 'kubectl get pods'
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
whoami
docker container run -d nginx
docker container ls
exit
```

```bash
kubectl delete -f 33-security-context-capabilities.yaml
k3d cluster delete meucluster
```