#Autor: Fagner Geraldes Braga  
#Data de criação: 28/03/2025  
#Data de atualização: 28/03/2025  
#Versão: 0.01

### Criando o primeiro cluster Kubernetes

```bash
# Cria um cluster Kubernetes utilizando k3d com a configuração padrão (geralmente um único nó mestre e um nó agente).
k3d cluster create

# Exibe informações sobre o cluster Kubernetes atual, incluindo o endereço do servidor API.
kubectl cluster-info

# Lista todos os nós do cluster, mostrando seu status e funções (mestre ou trabalhador).
kubectl get nodes

# Exibe o conteúdo do arquivo de configuração do Kubernetes (~/.kube/config), que contém credenciais e detalhes do cluster.
cat ~/.kube/config 

# Lista todos os contêineres em execução no Docker, o que pode ajudar a identificar os nós do cluster k3d.
docker container ls

# Lista todos os clusters criados com k3d na máquina atual.
k3d cluster list

# Exclui um cluster Kubernetes criado com k3d, removendo todos os nós e contêineres associados.
k3d cluster delete
```

### Criando um cluster Kubernetes sem Loadbalancer

```bash

# Cria um cluster Kubernetes chamado "fgb-cluster" usando k3d, sem um balanceador de carga integrado (--no-lb).
k3d cluster create fgb-cluster --no-lb

# Lista todos os clusters Kubernetes criados com k3d na máquina.
k3d cluster list

# Lista todos os contêineres em execução no Docker, incluindo os nós do cluster k3d.
docker container ls

# Lista os nós do cluster Kubernetes, mostrando seu status e funções (mestre ou agente).
kubectl get nodes

# Exclui o cluster chamado "fgb-cluster", removendo todos os seus componentes.
k3d cluster delete fgb-cluster
```

### Criando um cluster Kubernetes com 3 Servidores e 3 Agentes

```bash

# Cria um cluster Kubernetes chamado "fgb-cluster" usando k3d, com 3 nós de servidor (control plane) e 3 nós de agente (workers).
k3d cluster create fgb-cluster --servers 3 --agents 3

# Lista os nós do cluster Kubernetes, mostrando seus nomes, status, funções e versão do Kubernetes.
kubectl get nodes

# Lista todos os contêineres em execução no Docker, o que pode incluir os nós do cluster k3d.
docker container ls

# Lista todos os clusters Kubernetes criados com k3d na máquina.
k3d cluster list

# Exclui o cluster chamado "fgb-cluster", removendo todos os seus nós e contêineres associados.
k3d cluster delete fgb-cluster
```

### Criando um cluster Kubernetes com bind de porta no Loadbalancer

### 02-cluster.yaml
[02-cluster](02-cluster.yaml)

```bash

# Cria um cluster Kubernetes chamado "fgb-cluster" com:
# - 3 nós de servidor (control plane).
# - 3 nós de agente (workers).
# - Um mapeamento de porta redirecionando a porta 8080 da máquina host para a porta 28000 no balanceador de carga do cluster.
k3d cluster create fgb-cluster --servers 3 --agents 3 -p "8080:30000@loadbalancer"

# Lista os nós do cluster Kubernetes, mostrando seus nomes, status, funções e versão do Kubernetes.
kubectl get nodes

# Lista todos os contêineres em execução no Docker, incluindo os nós do cluster k3d.
docker container ls

# Aplica a configuração do arquivo "02-cluster.yaml", criando ou atualizando os recursos definidos nele (como Deployments, Services, etc.).
kubectl apply -f 02-cluster.yaml

# Lista todos os recursos no namespace atual, incluindo pods, serviços, deployments, replicasets e outros objetos.
kubectl get all

# Exclui o cluster chamado "fgb-cluster", removendo todos os seus nós e contêineres associados.
k3d cluster delete fgb-cluster
```