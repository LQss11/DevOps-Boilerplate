{{/*
Load config map key value pairs for env variables
*/}}
{{- define "sample.configMap.variables" }}
{{- range .Values.configmap.variables.list }}
{{ .key }}: {{ .value }}    
{{- end -}}
{{- end -}}
{{/*
Load config map files
*/}}
{{- define "sample.configMap.files" }}
{{- if and (.Values.configmap.files.enabled) -}}
{{- $currentScope := . -}}
{{ range $path, $_ :=  .Files.Glob  "config/*" }}
{{ $path  | replace "config/" "" }}: |
{{- with $currentScope}}
{{- tpl ( .Files.Get $path ) $currentScope | nindent 2 -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
This is a definition to load each volume from config maps
*/}}
{{- define "sample.configMap.volumes" -}}
{{- if and (.Values.configmap.files.enabled) (.Values.configmap.files.load) -}}
{{- if .Files.Glob "config/*" }}
{{- $currentScope := . -}}
{{- range $path, $_ :=  .Files.Glob  "config/*" }}
- name: {{ $path  | replace "config/" "" | replace "." "-"}} 
  configMap:
{{- with $currentScope}}
    name: {{ include "sample.fullname" . }}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
This is a definition to load each volume from config maps
*/}}
{{- define "nginx.configMap.volumeMounts" -}}
{{- if and (.Values.configmap.files.enabled) (.Values.configmap.files.load) -}}
{{- if .Files.Glob "config/*" -}}
{{- $currentScope := . -}}
{{- range $path, $_ :=  .Files.Glob  "config/*" }}
- name: {{ $path  | replace "config/" "" | replace "." "-"}} 
  mountPath: /app/{{ $path  | replace "config/" "" }} 
{{- with $currentScope}}
  subPath: {{ $path  | replace "config/" "" }} 
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}