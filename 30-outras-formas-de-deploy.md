#Autor: Fagner Geraldes  
#Data de criação: 17/01/2026  
#Data de atualização: 17/01/2026  
#Versão: 0.01  

### Outras formas de deploy

### DaemonSet

```bash
k3d cluster create meucluster --agents 3
kubectl apply -f 30-node-exporter.yaml && watch 'kubectl get pods'
k3d node create  fagner --cluster meucluster --role agent
k3d cluster delete meucluster
```

### Job

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl apply -f 30-sorteador.yaml && watch 'kubectl get pods'
kubectl delete -f 30-sorteador.yaml

kubectl apply -f 30-sorteador-job.yaml && watch 'kubectl get pods'
kubectl get job
kubectl get job -o wide
kubectl describe job sorteador

kubectl get pods
kubectl logs sorteador-tq7xg
kubectl logs sorteador-dgrgp
kubectl delete -f 30-sorteador-job.yaml

kubectl apply -f 30-sorteador-job.yaml && watch 'kubectl get pods,job'
kubectl delete -f 30-sorteador-job.yaml

kubectl apply -f 30-sorteador-job2.yaml && watch 'kubectl get pods,job'
kubectl delete -f 30-sorteador-job2.yaml
```

### CronJob

```bash
kubectl apply -f 30-sorteador-cron.yaml && watch 'kubectl get pods,cronjob,job'
kubectl delete -f 30-sorteador-cron.yaml

kubectl apply -f 30-sorteador-cron2.yaml && watch 'kubectl get pods,cronjob,job'
kubectl delete -f 30-sorteador-cron2.yaml
k3d cluster delete meucluster
```

### StatefulSet

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"

kubectl apply -f 30-statefulset.yaml && watch 'kubectl get pod'
kubectl delete -f 30-statefulset.yaml

kubectl apply -f 30-statefulset2.yaml && watch 'kubectl get pod'
kubectl get pvc
kubectl get pv

kubectl delete -f 30-statefulset2.yaml
```

### Headless Service

```bash
kubectl apply -f 30-headless-service.yaml && watch 'kubectl get pod'
kubectl get pod -o wide
kubectl get service

kubectl run curl --image fabricioveronez/ubuntu-curl -it -- /bin/bash

curl http://nginx-0.nginx.default.svc.cluster.local
curl http://nginx-1.nginx.default.svc.cluster.local
exit

kubectl delete -f 30-headless-service.yaml
k3d cluster delete meucluster
```