#!/bin/bash
kubeadm config images pull
echo "Preflight Check Passed: Downloaded All Required Images"
# Find more here https://kb.wisc.edu/ns/page.php?id=3493
POD_CIDR="192.168.0.0/16"

NODE_NAME=master-node
hostnamectl set-hostname ${NODE_NAME} 

# MASTER_IP=$(ip a s eth0 | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d' ' -f2)
# by default takse default interface--apiserver-advertise-address=$MASTER_IP
# --cri-socket=/var/run/cri-dockerd.sock 
sudo kubeadm init --pod-network-cidr=${POD_CIDR} --node-name ${NODE_NAME} 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config



# Install Calico Network Plugin
curl https://docs.projectcalico.org/manifests/calico.yaml -O

kubectl apply -f calico.yaml
rm -f calico.yaml
# Install Metrics Server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch deployment metrics-server -n kube-system --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'

# Install Kubernetes Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml


cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
---
EOF

kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}" >> /root/token

# Generete kubeadm join command
kubeadm token create --print-join-command > ./join.sh && chmod +x join.sh
