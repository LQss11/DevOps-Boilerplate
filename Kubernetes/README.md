# Random commands that might be useful
```sh
kubectl config get-contexts
# point on a ns different from default
kubectl config set-context --current --namespace=<ns-name>
```
test a pod with `ClusterIP` service type:
```sh
kubectl port-forward <pod-id> 8080:80
```