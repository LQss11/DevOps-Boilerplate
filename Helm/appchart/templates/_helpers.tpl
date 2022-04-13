{{/*
Expand the name of the chart.
appchart.name will take .Values.nameOverride if defined
else it will take default .Chart.Name 
*/}}
{{- define "appchart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* 
Define a yaml variable to be referenced later 
*/}}
{{- define "appchart.yaml" }}
yaml:
  key1: value1
  key2: 
    key21: value21
{{- end -}}

{{/* 
Define an test variable to be referenced later 
*/}}
{{- define "appchart.test" }}
test: testvalue
{{- end -}}

{{/* Declare example variables */}}
{{- define "appchart.example" -}}
test: {{ include "appchart.test" . }}
app_name: {{ .Chart.Name }}
app_version: "{{ .appchart.Version }}"
parent:
{{- include "appchart.yaml" . | nindent 2 }}
{{- end }}

{{- define "condition" }}

{{- if .Values.stringvar -}}
{{- default .Values.stringvar }}
{{- else if .Values.empty }}
  {{- default .Values.empty }}
{{- else -}}
  {{- default "aaaa" }}  
{{- end -}}
{{- end -}}


{{- define "appchart.imagePullPolicy" -}}
  {{- $env := default "development" .Values.environment }}
  {{- if not (eq $env "production") }}
    {{- "IfNotPresent" -}}
  {{- else }}
    {{- "Always" }}
  {{- end }}
{{- end }}