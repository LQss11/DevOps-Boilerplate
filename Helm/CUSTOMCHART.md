# Create custom charts
[Helm charts Docs](https://helm.sh/docs/topics/charts/)
Create  a new chart:
```sh
mkdir myapp && cd myapp
helm create myapp
```
Once the chart is created some initial files will be created, you can modify it and install it:
```sh
# Check tree of my app run `tree myapp`
helm install myapp1 myapp
```
You can also package the whole chart into a compressed file with:
```sh
helm package <path-of-helm-project>
```
You can start the chart using that compressed file by running
```sh
helm install myapp1 <path-to-compressed-package>
```

## Help for Notes
[Guide for built in objects](https://helm.sh/docs/chart_template_guide/builtin_objects/)
[Templating](http://masterminds.github.io/sprig/)