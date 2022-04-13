{{/*
Common labels https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/
*/}}
{{- define "sample.labels" -}}
helm.sh/chart: {{ include "sample.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: {{ .Values.labels.component }}
app.kubernetes.io/part-of: {{ .Values.labels.partOf }}      
app.kubernetes.io/created-by: {{ .Values.labels.createdBy }}   
{{ include "sample.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sample.selectorLabels" -}}
{{- $randomInstance := (randAlphaNum 5) -}}
app.kubernetes.io/name: {{ include "sample.name" . }}
app.kubernetes.io/instance: {{ include "sample.fullname" . }}-{{ .Values.labels.instance }}  
environment: {{ .Values.environment }}
{{- end }}
