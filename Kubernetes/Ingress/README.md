# INFO
Follow this [link](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start) for more

# Quick Setup for ingress controller 
You can either set it up using helm or yaml manifest directly:
- **HELM**
```sh
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace
```
- **YAML**
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.2/deploy/static/provider/cloud/deploy.yaml
```

# Local testing 
Create a simple web app
```sh
kubectl create deployment demo --image=httpd --port=80
kubectl expose deployment demo
```

```sh
kubectl create ingress demo-localhost --class=nginx --rule=demo.localdev.me/*=demo:80
```

Forward port to ingress controller
```sh
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
```
### Delete ressources
Once you are done you can delete both the webapp and the ingrsss resources:
```sh
kubectl delete deployment demo
kubectl delete service demo
kubectl delete ingress demo-localhost
```
