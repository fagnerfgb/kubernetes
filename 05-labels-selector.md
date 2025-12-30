#Autor: Fagner Geraldes Braga  
#Data de criação: 30/03/2025  
#Data de atualização: 30/03/2025  
#Versão: 0.01

### Labels Selector
### 05-labels-selector.yaml
[05-labels-selector](05-labels-selector.yaml)

```bash
# Aplica a configuração do arquivo "05-labels-selector.yaml", criando ou atualizando o pod definido nele.
kubectl apply -f 05-labels-selector.yaml

# Lista todos os pods no namespace atual.
kubectl get pods

# Lista apenas os pods que possuem o rótulo (label) "app=web".
kubectl get pods -l app=web

# Lista apenas os pods que possuem o rótulo (label) "versao=blue".
kubectl get pods -l versao=blue

# Lista apenas os pods que possuem o rótulo (label) "versao=green".
kubectl get pods -l versao=green

# Exclui os recursos definidos no arquivo "05-labels-selector.yaml", removendo o pod correspondente.
kubectl delete -f 05-labels-selector.yaml
```