# Installation
in order to install helm follow this [link](https://helm.sh/docs/intro/install/)
# Quick start 
To search for helm charts you can find them in [https://artifacthub.io/](https://artifacthub.io/) and once you know which one to install you can run this command first to add a repo:
```sh
# helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add repo <repo-name> <repo-url>
```
now that you have added a repo you can install some of its charts but first check if it got installed:
```sh
helm repo list
```
search for existing charts with keyword on installed repos:
```sh
helm search repo nginx
# Check all charts with all versions containing nginx server 
helm search repo --versions "nginx server"
```
now to start the k8s components through helm we can run:
```sh
# <chart-name> allo us to run same chart multiple times on k8s cluster 
helm install <chart-name> <repo>/<package>
# helm install nginx1 bitnami/nginx
helm install <repo>/<package> --generate-name # this will auto generate a unique name to the chart
helm install <chart-name> -n <repo>/<package> --create-namespace # Create namespace if not exists
```
```sh
helm install nginx2 --version 9.3.5 -n default bitnami/nginx
```

we can also override chart settings when setting them up by either creating a `values.yaml` file or by setting individual values:
```sh
helm install nginx3 --values values.yaml --set service.port=8080
```
>`values.yaml` variables must match chart settings, usually can be found in chart description.
>>you can check deployments by running `kubectl get svc <chart-name>` 

Look for all installed charts:
```sh
# this will only list services deployed on current namespace (default)
helm list 
# This will list all services 
helm list --all-namespaces
```

Upgrade helm chart:
```sh
helm upgrade <chart-name> --values values.yaml --version <version-number> --set service.type=NodePort --set service.port=8080 bitnami/nginx 
helm upgrade --install ... # will upgrade if chart exists and will install if it doesn't
helm upgrade ... --wait --timeout 15s # Wait 15 seconds and if pod isn't ready helm will mark this deployment as failed instead of deployed
```
some common flags when [upgrading](https://medium.com/@kcatstack/understand-helm-upgrade-flags-reset-values-reuse-values-6e58ac8f127e):

`--reset-values`: when upgrading, reset the values to the ones built into the chart.

`--reuse-values`: when upgrading, reuse the last release’s values and merge in any overrides from the command line via — set and -f. If ‘ — reset-values’ is specified, this is ignored.

delete chart:
```sh
helm uninstall <chart-name>
helm uninstall <chart-name> -n <ns>
# Keep history so we might want to bring it back up again and not delete its history permenently
helm uninstall <chart-name> --keep-history 
```
We can get chart notes again by running:
```sh
helm get notes <chart-name>
```
get values used on this chart (the ones specified by the user):
```sh
# add --all flag to show the default ones aswell
helm get values <chart-name>
```
Get chart manifests after being installed:
```sh
helm get manifests <chart-name> 
```
check the history of a chart:
```sh
helm history <chart-name>
```
## Roll back
to roll back to a recent revision run:
```sh
helm rollback <chart-name> <revision-number>
# helm rollback nginx1 3
```

## TEST HELM
you can test the chart without applying it by running:
```sh
helm install <chart-name> --values <values-file> --set <value> --dry-run bitnami/nginx
```
### Helm chart values hierarchy 
```
PARENT CHART VALUES < SUB CHART VALUES < --set flags
```
to check the helm output even if there is an error run with this command:
```sh
helm install --dry-run --disable-openapi-validation app1 ./my-chart
```

### Show option
You can get values and information before installation by running 
```sh
helm show <values/crds/readme/chart> jenkins/jenkins
```

## Issue
When I tried to upgrade label selectors on an already running chart i got this error
```sh
Error: UPGRADE FAILED: cannot patch "nginx" with kind Deployment: Deployment.apps "nginx" is invalid: spec.selector: Invalid value: v1.LabelSelector{MatchLabels:map[string]string{"app.kubernetes.io/instance":"nginx-randomval", "app.kubernetes.io/name":"nginx", "environment":"dev"}, MatchExpressions:[]v1.LabelSelectorRequirement(nil)}: field is immutable
```
to solve that all I had to do is delete deployment and upgrade again:
```sh
kubectl delete deployment nginx
helm upgrade --install nginx <chart-package>
```

# Setup helm private repo
to setup a private repo on a **Azure Blob Storage** you can follow [this example](https://cwienczek.com/2017/10/setting-up-secure-helm-chart-repository-on-azure-blob-storage/)