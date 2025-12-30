#Autor: Fagner Geraldes Braga  
#Data de criação: 30/03/2025  
#Data de atualização: 30/03/2025  
#Versão: 0.01

### Criando Pods

### 03-pod.yaml
[03-pod](03-pod.yaml)

```bash
# Cria um cluster Kubernetes usando k3d, chamado "meucluster", com 3 nós de servidor e 3 nós de agente (worker nodes).
k3d cluster create meucluster --servers 3 --agents 3

# Lista todos os tipos de recursos disponíveis na API do Kubernetes.
kubectl api-resources

# Aplica a configuração do arquivo "pod.yaml", criando ou atualizando os recursos definidos nele.
kubectl apply -f 03-pod.yaml

# Lista todos os pods no namespace atual.
kubectl get pods

# Lista todos os recursos do namespace atual, incluindo pods, serviços, deployments, etc.
kubectl get all

# Comando abreviado para listar os pods (po é um alias para pods).
kubectl get po

# Exibe detalhes completos sobre o pod chamado "web-color", incluindo eventos e status dos contêineres.
kubectl describe pod web-color

# Redireciona o tráfego da porta 8080 da máquina local para a porta 80 do pod "web-color".
kubectl port-forward pod/web-color 8080:80

# Lista os pods com informações adicionais, como o nó em que estão sendo executados e o IP atribuído.
kubectl get pods -o wide

# Exclui o pod chamado "web-color".
kubectl delete pod web-color

# Lista novamente os pods para verificar se "web-color" foi removido.
kubectl get pods
```