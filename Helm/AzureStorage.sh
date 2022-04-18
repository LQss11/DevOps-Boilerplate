az group create --name helmgroup --location "westeurope"
az storage account create --resource-group helmgroup --name helmstorage --sku Standard_LRS
# Export keys for auto auth
# https://docs.microsoft.com/en-us/azure/storage/blobs/authorize-data-operations-cli#set-environment-variables-for-authorization-parameters
export AZURE_STORAGE_ACCOUNT=helmstorage
export AZURE_STORAGE_KEY=$(az storage account keys list --resource-group helmgroup --account-name $AZURE_STORAGE_ACCOUNT | grep -m 1 value | awk -F'"' '{print $4}')
az storage container create --name helm
mkdir azure-helm-repository
helm fetch bitnami/nginx -d ./azure-helm-repository
helm repo index ./azure-helm-repository
# docker cp ./azure-helm-repository <azure-cli-container>:/azure-helm-repository
# az storage blob upload -f ./azure-helm-repository/file -c helm -n file
helm package ./chart -d ./azure-helm-repository
for FILE in ./azure-helm-repository/* ;do az storage blob upload -f $FILE -c helm -n  $(echo $FILE | cut -d "/" -f3) ;done
# Overwrite index if updated
az storage blob upload -f ./azure-helm-repository/index.yaml -c helm -n index.yaml --overwrite

az storage container generate-sas --name helm --expiry 2022-04-22 --permissions lr
generate shared access token --> se=2022-04-22&sp=rl&sv=2021-04-10&......

helm repo add azure "https://helmstorage.blob.core.windows.net/helm?<SAS-TOKEN>"
helm search repo azure