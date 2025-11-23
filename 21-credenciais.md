#Autor: Fagner Geraldes 
#Data de criação: 12/11/2025  
#Data de atualização: 12/11/2025  
#Versão: 0.01  

### Repositórios privados

### Montando o repositório privado

```bash
docker pull fabricioveronez/web-color:blue
docker pull fabricioveronez/web-color:green
docker tag fabricioveronez/web-color:green fagnerfgb/web-color:green
docker tag fabricioveronez/web-color:blue fagnerfgb/web-color:blue
docker push fagnerfgb/web-color:green && fagnerfgb/web-color:blue
docker image rm -f $(docker image ls -q)
docker logout
docker pull fagnerfgb/web-color:blue && docker pull fagnerfgb/web-color:green
docker login
docker pull fagnerfgb/web-color:blue && docker pull fagnerfgb/web-color:green
```
#Autor: Fagner Geraldes 
#Data de criação: 13/11/2025  
#Data de atualização: 13/11/2025  
#Versão: 0.01  

### Criacao das credenciais

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl create secret docker-registry docker-auth --docker-server=https://index.docker.io/v1/ --docker-username=fagnerfgb --docker-email=fagner.fgb@gmail.com --docker-password=
kubectl get secret
kubectl get secret docker-auth -o yaml
```

### Criacao do deployment com autenticacao

```bash
kubectl apply -f privado.yaml && watch 'kubectl get pods'
kubectl delete -f privado.yaml
k3d cluster delete meucluster
```


