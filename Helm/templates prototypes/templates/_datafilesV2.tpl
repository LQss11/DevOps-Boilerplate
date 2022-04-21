{{/*
Get secret files in base 64
*/}}
{{- define "lib.datafilesV2" }}
{{- $currentScope := . -}}
{{- range $path, $_ :=  .Files.Glob  "data/*" -}}
{{- with $currentScope -}}
{{- range .Values.secret.files -}}    
{{- if eq (replace "data/" "" $path) (.name)  -}}
{{- with $currentScope -}}
{{/*Replace .AsSecrets with .AsConfig to use configmaps instead*/}}
{{ tpl (.Files.Glob ($path)).AsSecrets $currentScope  }}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}