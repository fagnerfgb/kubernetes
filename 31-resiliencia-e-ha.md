#Autor: Fagner Geraldes  
#Data de criação: 19/01/2026  
#Data de atualização: 19/01/2026  
#Versão: 0.01  

### Resiliência e Alta disponibilidade

### Horizontal Pod AutoScaler

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl top nodes # necessita de instalação do metrics server
kubectl apply -f 31-hpa.yaml && watch 'kubectl get pods'
kubectl top pod
watch 'kubectl get hpa,pod'
kubectl delete -f 31-hpa.yaml
```

### Scale Up e Scale Down

```bash
kubectl apply -f 31-hpa2.yaml
watch 'kubectl get hpa,pod'
kubectl delete -f 31-hpa2.yaml
```

### Métricas por container

```bash
kubectl apply -f 31-hpa3.yaml
watch 'kubectl get hpa,pod'
kubectl delete -f 31-hpa2.yaml
k3d cluster delete meucluster
```

### Gerenciamento de Labels nos nodes

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl get nodes
kubectl get nodes --show-labels
kubectl describe nodes k3d-meucluster-agent-0 | grep Labels: -A 10
kubectl label nodes k3d-meucluster-agent-0 disktype=ssd
kubectl describe nodes k3d-meucluster-agent-0 | grep disktype=ssd
kubectl label nodes k3d-meucluster-agent-0 disktype=hd --overwrite
kubectl label nodes k3d-meucluster-agent-0 disktype-
k3d cluster delete meucluster
```

### Node Selector

```bash
k3d cluster create meucluster --servers 1 --agents 6 -p "30000:30000@loadbalancer"
kubectl apply -f 31-node-selector.yaml
kubectl get pods -o wide
kubectl label nodes k3d-meucluster-agent-0 disktype=ssd
kubectl label nodes k3d-meucluster-agent-1 disktype=ssd
kubectl label nodes k3d-meucluster-agent-2 disktype=ssd
kubectl label nodes k3d-meucluster-agent-3 disktype=hd
kubectl label nodes k3d-meucluster-agent-4 disktype=hd
kubectl label nodes k3d-meucluster-agent-5 disktype=hd
kubectl apply -f 31-node-selector.yaml && watch 'kubectl get pod -o wide'
kubectl delete -f 31-node-selector.yaml
k3d cluster delete meucluster
```

### Node Affinity

```bash
k3d cluster create meucluster --servers 1 --agents 6 -p "30000:30000@loadbalancer"

kubectl label nodes k3d-meucluster-agent-0 disktype=ssd
kubectl label nodes k3d-meucluster-agent-1 disktype=ssd
kubectl label nodes k3d-meucluster-agent-2 disktype=ssd
kubectl label nodes k3d-meucluster-agent-3 disktype=hd
kubectl label nodes k3d-meucluster-agent-4 disktype=hd
kubectl label nodes k3d-meucluster-agent-5 disktype=hd

kubectl label nodes k3d-meucluster-agent-0 gpuprocess=true
kubectl label nodes k3d-meucluster-agent-1 gpuprocess=false
kubectl label nodes k3d-meucluster-agent-2 gpuprocess=true
kubectl label nodes k3d-meucluster-agent-3 gpuprocess=false
kubectl label nodes k3d-meucluster-agent-4 gpuprocess=true
kubectl label nodes k3d-meucluster-agent-5 gpuprocess=false

kubectl label nodes k3d-meucluster-agent-0 region=regiona
kubectl label nodes k3d-meucluster-agent-1 region=regionb
kubectl label nodes k3d-meucluster-agent-2 region=regiona
kubectl label nodes k3d-meucluster-agent-3 region=regiona
kubectl label nodes k3d-meucluster-agent-4 region=regionb
kubectl label nodes k3d-meucluster-agent-5 region=regionb


kubectl apply -f 31-node-affinity.yaml && watch 'kubectl get pod -o wide'
kubectl delete -f 31-node-affinity.yaml
kubectl apply -f 31-node-affinity2.yaml && watch 'kubectl get pod -o wide'
kubectl delete -f 31-node-affinity2.yaml
kubectl apply -f 31-node-affinity3.yaml && watch 'kubectl get pod -o wide'
kubectl delete -f 31-node-affinity3.yaml
k3d cluster delete meucluster
```