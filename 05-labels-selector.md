#Autor: Fagner Geraldes Braga  
#Data de criação: 30/03/2025  
#Data de atualização: 30/03/2025  
#Versão: 0.01

### Labels Selector
### pod01.yaml
[pod01](pod01.yaml)

```bash
# Aplica a configuração do arquivo "pod01.yaml", criando ou atualizando o pod definido nele.
kubectl apply -f pod01.yaml

# Lista todos os pods no namespace atual.
kubectl get pods

# Lista apenas os pods que possuem o rótulo (label) "app=web".
kubectl get pods -l app=web

# Lista apenas os pods que possuem o rótulo (label) "versao=blue".
kubectl get pods -l versao=blue

# Lista apenas os pods que possuem o rótulo (label) "versao=green".
kubectl get pods -l versao=green

# Exclui os recursos definidos no arquivo "pod01.yaml", removendo o pod correspondente.
kubectl delete -f pod01.yaml
```