# Values file reference from values
In this chart you will see how you could reference values from values within **Values.yaml** file.

You can run this command to get the output in a result.yaml file:
```sh
helm install --dry-run --debug example . >result.yaml
```
following this [helm doc about yaml anchors](https://helm.sh/docs/chart_template_guide/yaml_techniques/#yaml-anchors) I managed to reference to variables within variables.
