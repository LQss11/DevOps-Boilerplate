# Links
- [CNI information](https://chrislovecnm.com/kubernetes/cni/choosing-a-cni-provider/)*
- [Setting the proper CIDR block with kubeadm init](https://stackoverflow.com/a/51143457/13541620)
- [Kubeadm init flags and help(official docs)](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/)

# Container runtimes sockets
| CR                                | Socker                                     |
| --------------------------------- | ------------------------------------------ |
| containerd                        | unix:///var/run/containerd/containerd.sock |
| CRI-O                             | unix:///var/run/crio/crio.sock             |
| Docker Engine (using cri-dockerd) | unix:///var/run/cri-dockerd.sock           |


# Join cluster
```sh
# RANDOM=$$
# NODE_NAME=worker
# hostnamectl set-hostname ${NODE_NAME} 
kubeadm token create --print-join-command > ./join.sh && chmod +x join.sh
```
to allow master node schedule pods
```sh
kubectl taint nodes master-node node-role.kubernetes.io/master:NoSchedule-
```