# AZURE BASIC COMMANDS
Login to az account: 
```sh
az login # Will open terminal
az login -u <username> -p <password> # plaintext
read -sp "Azure password: " AZ_PASS && echo && az login -u <username> -p $AZ_PASS # Bash
```