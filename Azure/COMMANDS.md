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
- query someething `az ad signed-in-user show -o yaml --query otherMails`
- create resource group: `az group create --name mygroup --location "france"` 
- get current subscription been used: `az account list`
- get current rgs: `az group list -o table`
- list all resources in rg: `az resource list -g helmgroup`
- list azure providers: `az provider list -o table | awk  '{print $1}' | tail +3`
- get all resource ypes from a provider: `az provider list --query "[?namespace=='Microsoft.Compute'].[resourceTypes[*].resourceType]" -o yaml`
- delete resource `az resource delete --resource-group ExampleResourceGroup --name ExampleVM --resource-type "Microsoft.Compute/virtualMachines"`
- get all resource types: `az provider list -o table | awk  '{print $1}' | tail +3 | xargs -I {}  az provider list --query "[?namespace=='{}'].[resourceTypes[*].resourceType]" -o yaml`