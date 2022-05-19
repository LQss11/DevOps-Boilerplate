# host.docker.internal on linux
On Linux, add `--add-host=host.docker.internal:host-gateway` to your Docker command to enable this feature. 
Docker Compose on Linux:
```yaml
extra_hosts:
    - "host.docker.internal:host-gateway"
```