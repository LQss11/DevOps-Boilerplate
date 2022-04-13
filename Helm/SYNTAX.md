- Define a variable:
[link for predefined varaibles](https://helm.sh/docs/chart_template_guide/builtin_objects/)
```yaml
{{- define "CHART.VARIABLE" -}}
app: {{ include "CHART.name" . }}
app_name: {{ .CHART.Name }}
app_version: "{{ .CHART.Version }}"
{{- end }}
```
>As you have noticed we could call a variable inside a declared variable with `include`.
1. `CHART` is the chart name from **chart.yaml**
2. `VARIABLE` declared variable that could be used in yaml files like this:
```yaml
metadata:
  name: {{ include "chartx.fullname" . }}
  labels:
    {{- include "chartx.labels" . | nindent 4 }}
```
We could also use **template** instead of **include** but `It is considered preferable to use include over template in Helm templates simply so that the output formatting can be handled better for YAML documents.`