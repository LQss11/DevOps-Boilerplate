{{/*
Load config map key value pairs for env variables
*/}}
{{- define "sample.configMap.variables" }}
{{- range .Values.configmap.variables }}
{{ .key }}: {{ .value }}    
{{- end -}}
{{- end -}}
{{/*
Load config map files
*/}}
{{- define "sample.configMap.files" }}
{{- $currentScope := . -}}
{{ range $path, $_ :=  .Files.Glob  "config/*" }}
{{ $path  | replace "config/" "" }}: |
{{- with $currentScope}}
{{- tpl ( .Files.Get $path ) $currentScope | nindent 2 -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
This is a definition to load each volume from config maps
*/}}
{{- define "sample.configMap.volumes" -}}
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


{{/*
This is a definition to load each volume from config maps
*/}}
{{- define "sample.configMap.volumeMounts" -}}
{{- if .Files.Glob "config/*" -}}
{{- $currentScope := . -}}
{{- range $path, $_ :=  .Files.Glob  "config/*" }}
- name: {{ $path  | replace "config/" "" | replace "." "-"}} 
  mountPath: /app/{{ $path  | replace "config/" "" }} 
{{- with $currentScope}}
  subPath: {{ $path  | replace "config/" "" }} 
{{- end -}}
{{- end -}}
{{- end }}
{{- end -}}