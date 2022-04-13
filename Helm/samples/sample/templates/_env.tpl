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
{{- range .Values.configmap.variables }}
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
{{- range .Values.secret.variables }}
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
{{- if or (.Values.configmap.enabled) (.Values.secret.enabled) (.Values.env.enabled) -}}
env:
{{- if .Values.env.enabled -}}
{{- include "sample.env" . | nindent 2 }}
{{- end -}}
{{- if .Values.secret.enabled -}}
{{- include "sample.secret.env" . | nindent 2 }}
{{- end -}}
{{- if .Values.configmap.enabled -}}
{{- include "sample.configMap.env" . | nindent 2 }}
{{- end -}}
{{- end -}}
{{- end -}}