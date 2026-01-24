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
```

### User Account

```bash
code ~/.kube/config
```

### Service Account

```bash
kubectl apply -f 33-service-account.yaml && watch 'kubectl get pods'
kubectl describe $(kubectl get pod -o name) | grep "Service Account:"
kubectl get sa
kubectl describe sa default
kubectl describe sa web
kubectl describe $(kubectl get pod -o name) | grep Mounts: -A 1
kubectl exec -it $(kubectl get pod -o name) -- /bin/sh
```

```bash
ls /var/run/secrets/kubernetes.io/serviceaccount
exit
```

```bash
kubectl delete -f 33-service-account.yaml
kubectl apply -f 33-service-account2.yaml && watch 'kubectl get pods'
kubectl describe $(kubectl get pod -o name) | grep "Service Account:"
kubectl describe $(kubectl get pod -o name) | grep Mounts: -A 1
kubectl delete -f 33-service-account2.yaml
```

### Service Account - Criando o secret

```bash
kubectl apply -f 33-service-account3.yaml && watch 'kubectl get pods'
kubectl get secret
kubectl describe secret web-secret
kubectl delete -f 33-service-account3.yaml
```

### Service Account - Autenticação ao Container Registry

```bash
kubectl apply -f 33-service-account4.yaml && watch 'kubectl get pods'
kubectl create secret docker-registry dockerhub-auth --docker-server=https://index.docker.io/v1/ --docker-username=fagnerfgb --docker-email=fagner.fgb@gmail.com --docker-password=
kubectl apply -f 33-service-account4.yaml && watch 'kubectl get pods'
kubectl get secret
kubectl delete -f 33-service-account4.yaml
kubectl apply -f 33-service-account4.yaml && watch 'kubectl get pods'
kubectl delete secret dockerhub-auth
kubectl delete -f 33-service-account4.yaml
```

### RBAC

### RBAC - Kube-Board

```bash
kubectl apply -f 33-rbac.yaml && watch 'kubectl get pods'
kubectl logs $(kubectl get pod -o name)
kubectl delete -f 33-rbac.yaml

kubectl apply -f 33-rbac2.yaml && watch 'kubectl get pods'
kubectl get clusterrole | grep full-access
kubectl describe clusterrole full-access
kubectl delete -f 33-rbac2.yaml

kubectl apply -f 33-rbac3.yaml && watch 'kubectl get pods'
kubectl logs $(kubectl get pod -o name)
kubectl delete -f 33-rbac3.yaml

kubectl apply -f 33-rbac4.yaml && watch 'kubectl get pods'
kubectl delete -f 33-rbac4.yaml

kubectl apply -f 33-rbac5.yaml && watch 'kubectl get pods'
kubectl delete -f 33-rbac5.yaml
k3d cluster delete meucluster
```