# https://github.com/kubernetes/kubernetes/releases
# https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.24.md#downloads-for-v1240
wget https://github.com/kubernetes/kubernetes/releases/download/v1.18.12/kubernetes.tar.gz
apt install hashalot
sha256 kubernetes.tar.gz
sha512sum kubernetes.tar.gz