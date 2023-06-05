find . -name file.txt
grep -R "my-secret" .
less -f -r /var/lib/etcd/member/wal/0000000000000000-0000000000000000.wal
check | hexdump -C
echo -n 'mysecret' | base64
echo bX1wYXNzd29yZDEyMw== | base64 -d
# https://unix.stackexchange.com/a/120825/508392
compgen -c | grep ls

# Check if existing connection on port: 
netstat -ntlp
# DUMP that captures net trafic on loopback interface and port 2379
tcpdump -i lo -X port 2379

# Get ipaddress from dns 
nslookup google.com

# Move to another user group (ex docker group)
newgrp docker 
id

# Get release version
cat /etc/os-release 
uname -r 
# get resources details (top/htop must be enough sometimes)
df -h 
free -m

# If ps command not available (get name)
cat /proc/<process-id>/cmdline

# apps in background
# PRESS ENTER then run this whenever you wan to get it back in jobs
kubectl port-forward <pod> 8080:80 &
jobs



wget --spider -timeout=1 <ipaddress>