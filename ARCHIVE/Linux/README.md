# History
Delete history from 50 - to 100
```sh
for h in $(seq 50 100); do history -d 50; done; history -d $(history 1 | awk '{print $1}')
```
# Check among ips
```sh
cat some_file | awk {'prin $1'} >/tmp/test/IPS
for i in $(cat /tmp/test/IPS) ;do timeout 3 ping -c 2 $i &>/dev/null && echo $? $i || echo $? $i ;done
```
