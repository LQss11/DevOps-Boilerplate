# Run metrics server on k8s
```sh
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

Once the image gets pulled and ready you can check pods/nodes metrics by running:
```sh
kubectl top <node/pod>
```

### Reference 
[metric server git repo](https://github.com/kubernetes-sigs/metrics-server)

# Kubectl text editor
when running command kubectl edit k8s will use the default text editor of your os but you can specify yours by following this [link](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-DC2BB6E0-A327-4DB8-9A87-5F3376E70033.html), (e.g simply by setting `KUBE_EDITOR=path_to_editor -w`)

# Env refernce from another Env 
You can read this [SO answer](https://stackoverflow.com/questions/49582349/kubernetes-how-to-refer-to-one-environment-variable-from-another) as he said **Also please note that, as mentioned in the Docs, the variable to expand must be defined before the variable referencing it.**