#Autor: Fagner Geraldes 
#Data de criação: 12/11/2025  
#Data de atualização: 12/11/2025  
#Versão: 0.01  

### Repositórios privados

### Montando o repositório privado

```bash
docker pull fabricioveronez/web-color:blue
docker pull fabricioveronez/web-color:green
docker tag fabricioveronez/web-color:green fagnerfgb/web-color-priv:green
docker tag fabricioveronez/web-color:blue fagnerfgb/web-color-priv:blue
docker push fagnerfgb/web-color-priv:green && docker push fagnerfgb/web-color-priv:blue
docker image rm -f $(docker image ls -q)
docker logout
docker pull fagnerfgb/web-color-priv:blue && docker pull fagnerfgb/web-color-priv:green
docker login
docker pull fagnerfgb/web-color-priv:blue && docker pull fagnerfgb/web-color-priv:green
```
### Criação das credenciais

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl create secret generic docker-auth --from-file=.dockerconfigjson=/home/fagner/.docker/config.json
kubectl get secret
kubectl get secret docker-auth -o yaml
```

### Criacao do deployment com autenticacao

```bash
kubectl apply -f 21-privado.yaml && watch 'kubectl get pods'
kubectl describe pod
kubectl delete -f 21-privado.yaml
kubectl delete secret docker-auth
k3d cluster delete meucluster
```


