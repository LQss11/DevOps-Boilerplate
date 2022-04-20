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
Get all api-resources
```sh
kubectl --kubeconfig /kube/config api-resources | awk '{print $1}' >/tmp/api-resources && for i in $(cat /tmp/api-resources) ;do echo -e "\n\n############################################## $i ##############################################" && kubectl --kubeconfig /kube/config get $i -A 2>/dev/null  ;done
```
