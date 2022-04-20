# Linux
alias kall='kubectl get all'
# windows
doskey kall=kubectl get all

# Kubectl aliases!
```sh
doskey k=kubectl $*
doskey ka=kubectl get all
doskey kns=kubectl get --all-namespaces
doskey knss=kubectl get namespaces
doskey klogs=kubectl logs -f deployment/$1
doskey kex=kubectl exec -it deployment/$*
doskey kns=kubectl config set-context --current --namespace=$1
doskey kpf=kubectl port-forward deployment/$1 $2
```