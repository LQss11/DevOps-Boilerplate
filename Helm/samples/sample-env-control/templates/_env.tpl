{{/*
Simple Environment Variables 
*/}}
{{- define "sample.env" }}
{{- range .Values.env.variables }}
- name: {{ .name }}
  value: {{ .value }}     
{{- end -}}
{{- end -}}

{{/*
Environment Variables from config map 
*/}}
{{- define "sample.configMap.env" }}
{{- $currentScope := . -}}
{{- range .Values.configmap.variables.list }}
- name: {{ .key }}
  valueFrom:
    configMapKeyRef:
      {{- with $currentScope }}
      name: {{ include "sample.fullname" . }}
      {{- end }}
      key: {{ .key }}    
{{- end -}}
{{- end -}}

{{/*
Environment Variables from secrets 
*/}}
{{- define "sample.secret.env" }}
{{- $currentScope := . -}}
{{- range .Values.secret.variables.list }}
- name: {{ .key }}
  valueFrom:
    secretKeyRef:
      {{- with $currentScope }}
      name: {{ include "sample.fullname" . }}
      {{- end }}
      key: {{ .key }}    
{{- end -}}
{{- end -}}



{{- define "sample.environmentVariables" }}
{{- if or (.Values.secret.variables.load) (.Values.configmap.variables.load) (.Values.env.enabled) -}}
env:
{{- if .Values.env.enabled -}}
{{- include "sample.env" . | nindent 2 }}
{{- end -}}
{{- if and (.Values.secret.variables.load) (.Values.secret.variables.enabled) -}}
{{- include "sample.secret.env" . | nindent 2 }}
{{- end -}}
{{- if and (.Values.configmap.variables.load) (.Values.configmap.variables.enabled) -}}
{{- include "sample.configMap.env" . | nindent 2 }}
{{- end -}}
{{- end -}}
{{- end -}}