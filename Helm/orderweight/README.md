# Helm hooks
In order to controll creation order you can use `helm hooks`.

In order to implement them you will need to add some annotations to the manifest files, like in this example where we are using **cm** and **secret** usually there is an order specified by helm which creates resources by manifest type, then by asc manifest names.

to check k8s resources creation order you can watch events:
```sh
kubectl get events --watch
```
then by running:
```sh
helm install orderweight . 
```
you will see that resources are being created by order (1 then 2 ...) and values could be negative.

you can read more in [Helm docs about hooks](https://helm.sh/docs/topics/charts_hooks/)