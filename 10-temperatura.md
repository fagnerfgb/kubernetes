#Autor: Fagner Geraldes 
#Data de criação: 02/04/2025  
#Data de atualização: 02/04/2025  
#Versão: 0.01  

## Conversão Temperatura

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

docker build -t fagnerfgb/temperatura:v1 -f ./projetos/celsius-farenheit/Dockerfile ./projetos/celsius-farenheit/src

docker tag fagnerfgb/temperatura:v1 fagnerfgb/temperatura:latest

docker push fagnerfgb/temperatura:v1 && docker push fagnerfgb/temperatura:latest

docker image ls | grep temperatura

kubectl apply -f ./projetos/celsius-farenheit/k8s/deployment.yaml

watch 'kubectl get all'

kubectl delete -f ./projetos/celsius-farenheit/k8s/deployment.yaml

k3d cluster delete meucluster
```