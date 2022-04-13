{{/*
Get key value of each secret
*/}}
{{- define "sample.secrets" }}
{{- range .Values.secret.variables }}
{{ .key }}: {{ .value | b64enc }}    
{{- end -}}
{{- end -}}

{{/*
Get secret files in base 64
*/}}
{{- define "sqlserver.secretfiles" }}
{{- if .Files.Glob "secret-files/*" -}}
{{ (.Files.Glob "secret-files/*").AsSecrets }}
{{- end -}}
{{- end -}}