{{/*
Get secret files in base 64
*/}}
{{- define "lib.datafilesV1" }}
{{- $currentScope := . -}}
{{ range $path, $_ :=  .Files.Glob  "data/*" }}
{{- with $currentScope -}}
{{- range .Values.secret.files }}    
{{- if eq (replace "data/" "" $path) (.name)  }}
{{ $path  | replace "data/" "" }}: |
{{- with $currentScope }}
{{- tpl ( .Files.Get $path ) $currentScope  | b64enc | nindent 2 -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}