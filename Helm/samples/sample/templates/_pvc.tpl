{{- define "sample.pvc.volumeMounts" }}
{{- if .Values.persistence.enabled }}
- name: {{ .Values.persistence.name }}
  mountPath: {{ .Values.persistence.mountPath }}
{{- end }}
{{- end -}}


{{- define "sample.pvc.volumes" }}
{{- if .Values.persistence.enabled }}
- name: {{ .Values.persistence.name }}
  persistentVolumeClaim:
    claimName: {{ include "sample.fullname" . }}
{{- end }}
{{- end -}}