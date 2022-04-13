{{/*
Get key value of each secret
*/}}
{{- define "sample.secrets" }}
{{- if and (.Values.secret.variables.enabled) -}}
{{- range .Values.secret.variables.list }}
{{ .key }}: {{ .value | b64enc }}    
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Get secret files in base 64
*/}}
{{- define "sample.secretfiles" }}
{{- if and (.Values.secret.files.enabled) }}
{{ (.Files.Glob "secret-files/*").AsSecrets }}
{{- end -}}
{{- end -}}

