# History
Delete history from 50 - to 100
```sh
for h in $(seq 50 100); do history -d 50; done; history -d $(history 1 | awk '{print $1}')
```
