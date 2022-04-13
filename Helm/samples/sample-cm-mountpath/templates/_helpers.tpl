{{/*
Expand the name of the chart.
*/}}
{{- define "sample.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sample.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sample.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Use nodeport if service with type loadbalancer/nodeport 
*/}}
{{- define "sample.nodePort" }}
{{- if (ne .Values.service.type "ClusterIP")  -}}
nodePort: {{ .Values.service.nodePort}}
{{- end -}}
{{- end -}}

{{/*
Volumes and volume mounts
*/}}
{{- define "sample.persistence" }}
          volumeMounts:
{{- if .Values.configmap.enabled -}}
{{- include "sample.configMap.volumeMounts" . | indent 12 }}   
{{- end }}
{{- if .Values.persistence.enabled }}
{{- include "sample.pvc.volumeMounts" . | indent 12 }}
{{- end }}
      volumes:
{{- if .Values.configmap.enabled -}}
{{- include "sample.configMap.volumes" . | indent 8 }}     
{{- end }}  
{{- if .Values.persistence.enabled }}
{{- include "sample.pvc.volumes" . | indent 8 }}
{{- end -}}  
{{- end -}}
