#Autor: Fagner Geraldes 
#Data de criação: 24/11/2025  
#Data de atualização: 24/11/2025  
#Versão: 0.01  

## Volumes

### Host Path

```bash
# https://kubernetes.io/docs/concepts/storage/persistent-volumes/

k3d cluster create meucluster --servers 3 --agents 3 -p "5432:30000@loadbalancer"
kubectl get nodes

kubectl apply -f 27-hostpath.yaml
watch 'kubectl get pod'
kubectl delete $(kubectl get pod -o name)
watch 'kubectl get pod'
kubectl get pod -o wide
kubectl delete -f 27-hostpath.yaml
```

### NFS

```bash

# Criei um VM com o Ubuntu e usei a placa de rede em modo bridge e com IP dinâmico para testar
# Colocar o IP da VM no arquivo 27-pv.yaml

#Primeiro eu devo instalar o NFS kernel server
sudo apt update && sudo apt install nfs-kernel-server -y

#Crio o diretório que quero compartilhar

sudo mkdir -p /mnt/nfs_shared 
sudo chown -R nobody:nogroup /mnt/nfs_shared/
sudo chmod 777 /mnt/nfs_shared/

#Compartilhamento do diretório

#Agora eu mapeio os diretório que vou utilizar

sudo vim /etc/exports

/mnt/nfs_shared *(rw,sync,no_subtree_check,no_root_squash,insecure)

#- /mnt/nfs_shared: Caminho no servidor NFS que está sendo compartilhado. Representa a localização dos arquivos e diretórios disponíveis para os clientes NFS.
#- * : Indica que qualquer cliente pode montar este compartilhamento, representando todos os endereços IP. Para maior segurança, pode ser substituído por endereços IP específicos ou faixas de IP.
#- rw: Permissão de leitura e escrita para os clientes NFS, permitindo que modifiquem os arquivos no compartilhamento.
#- sync: As modificações nos arquivos são escritas no disco antes que as operações sejam consideradas concluídas, aumentando a integridade dos dados.
#- no_subtree_check: Desativa a verificação de sub-árvores para melhorar o desempenho do NFS, embora deva ser usada com cautela.
#- no_root_squash: Desativa a transformação de solicitações do usuário root em solicitações não privilegiadas, aumentando o risco de segurança mas permitindo que o root nos clientes NFS tenha os mesmos privilégios que o root no servidor.
#- insecure: Permite conexões de clientes NFS usando portas acima de 1024, necessário em alguns ambientes ou configurações de firewall.

#Reinicio o serviço

sudo exportfs -a
sudo systemctl restart nfs-kernel-server
```

```bash
kubectl apply -f 27-pv.yaml
kubectl get persistentvolume
kubectl describe persistentvolume

kubectl apply -f 27-nfs.yaml
kubectl get persistentvolumeclaim
kubectl describe persistentvolumeclaim

watch 'kubectl get pod'

kubectl delete $(kubectl get pod -o name)

watch 'kubectl get pod'

kubectl delete -f 27-nfs.yaml
kubectl delete -f 27-pv.yaml
```

### Storage Class

```bash
kubectl get storageclass
kubectl get nodes
kubectl apply -f 27-storage-class.yaml
kubectl get pv
kubectl get pvc
watch 'kubectl get pod'
kubectl delete $(kubectl get pod -o name)
watch 'kubectl get pod'
kubectl delete -f 27-storage-class.yaml
```

### Limit Range

```bash
kubectl apply -f 27-limit.yaml
kubectl get limitrange
kubectl describe limitrange storagelimit
kubectl apply -f 27-storage-class.yaml
kubectl delete -f 27-limit.yaml

kubectl apply -f 27-limit2.yaml
kubectl get limitrange
kubectl describe limitrange storagelimit
kubectl apply -f 27-storage-class.yaml
kubectl delete -f 27-storage-class.yaml
kubectl delete -f 27-limit2.yaml
```

### Resource Quota

```bash
# 1 Storage de 4GB - OK
kubectl apply -f 27-resource-quota.yaml
kubectl apply -f 27-storage-class.yaml
kubectl get resourcequota
kubectl get pods
kubectl delete -f 27-storage-class.yaml
```

```bash
# 2 Storages de 4GB cada - Excede a capacidade
kubectl apply -f 27-storage-class2.yaml
```

```bash
# 3 Storages - Excede a quantidade de pvc
kubectl apply -f 27-storage-class3.yaml
kubectl delete -f 27-storage-class3.yaml
kubectl delete -f 27-resource-quota.yaml
k3d cluster delete meucluster
```

### Configmap com Volume

```bash
k3d cluster create meucluster --servers 3 --agents 3 -p "30000:30000@loadbalancer"
kubectl apply -f 27-configmap.yaml
kubectl get pod

kubectl create configmap pagina-nginx --from-file ./index.html
kubectl get configmap
kubectl describe configmap pagina-nginx
kubectl apply -f 27-configmap.yaml
kubectl get pod
kubectl delete -f 27-configmap.yaml
kubectl delete configmap pagina-nginx
```

### Secret com Volume

```bash
kubectl create secret generic pagina-nginx --from-file ./index.html
kubectl get secret
kubectl describe secret pagina-nginx
kubectl apply -f 27-secret.yaml
kubectl get pod
kubectl delete -f 27-secret.yaml
kubectl delete secret pagina-nginx
k3d cluster delete meucluster
```