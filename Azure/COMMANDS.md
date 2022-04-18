# AZURE BASIC COMMANDS
Login to az account: 
```sh
az login # Will open terminal
az login -u <username> -p <password> # plaintext
read -sp "Azure password: " AZ_PASS && echo && az login -u <username> -p $AZ_PASS # Bash
```
get signed in users: `az ad signed-in-user show`

get all locations:
```sh
az account list-locations --output table
```
query someething `az ad signed-in-user show -o yaml --query otherMails`

create resource group: `az group create --name mygroup --location "france"` 