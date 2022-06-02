# https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#enable-shell-autocompletion
kubectl completion
kubectl port-forward --address=0.0.0.0 deployment/app 3000
kubectl run nginx-pod --image=nginx -l=app=nginx
kubectl expose pod nginx-pod --port=80 --target-port=80 --name=nginx 
kubectl exec -it pod/nginx-pod -- sh
# You connect to apiserver when run 
kubectl proxy --port=8085
# list all resources
kubectl api-resources 
kubectl get <resource> -o yamls
# Generate simple template
kubectl run nginx-pod --image=nginx --dry-run=client -o yaml >mynginxyaml
kubectl create secret docker-registry my-secret --docker-username=user --docker-password=password --docker-email=email --docker-server=docker.io --dry-run=client -o yaml >
secret.yaml
kubectl describe nodes minikube
kubectl delete all --all --force --grace-period=-1
kubectl scale deployment my-deployment --replicas=4

kubectl label deployment nginx-deployment env=class
# to remove that label
kubectl label deployment nginx-deployment env-

kubectl rollout undo
kubectl rollout undo deployment nginx --to-revision=1
# Show information
kubectl rollout history deployment nginx --revision=2
kubectl get all --show-labels

# You can save a deployment state without it being consuming resources
kubectl scale deployment nginx --replicas=0 

kubectl autoscale deployment nginx --cpu-percent=50 --min=1 --max=10

kubectl run -it --rm --image=busybox load-generator -- /bin/sh -c "while sleep 0.5; do wget -q -O- http://....; done"

kubectl create ingress my-ingress --rule="mars.example.com/=mars:80" --rule="saturn.example.com/=saturn:80"

# Docker registry creds
kubectl create secret dockeer-registry my-secret --docker-server=DOCKER_REG_SERVER --docker-username=DOCKER_USER --docker-password=DOCKER_PASSWORD --docker-email=DOCKER_EMAIL
kubectl create secret dockeer-registry my-secret --from-file=.dockerconfigjson=path/to/config.json

# expose kube api to host to use curl on
kubectl proxy --port=8088 &
curl http://localhost:8088/api/v1/namespaces/default/pods/
# Delete container from the kube-apiserver
curl -XDELETE http://localhost:8088/api/v1/namespaces/default/pods/<pod-id>

kubectl auth can-i get pods
kubectl create secret generic regcred --from-file=.dockerconfigjson=config.json --type=kubernetes.io/dockerconfigjson --dry-run=client -o yaml >regcred.yaml
```json
{"auths": {"acrtest.azurecr.io": {"username": "acrtest","password": "StrongPassword"}}}
```
