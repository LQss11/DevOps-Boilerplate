[??](https://github.com/slydeveloper/docker-registry-joxit-ui-compose/blob/master/docker-compose.yml
https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file)
[Registry uris](https://docs.docker.com/registry/spec/api/#detail)
{
  "insecure-registries": [
    "localhost:5000"
  ],
  "debug": true,
  "experimental": false,
  "registry-mirrors": [],
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "features": {
    "buildkit": true
  }
}
