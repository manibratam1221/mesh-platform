{{- define "mesh-service.fullname" -}}
{{ .Values.name }}
{{- end }}

{{- define "mesh-service.labels" -}}
app.kubernetes.io/name: {{ .Values.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Values.labels.version }}
app.kubernetes.io/managed-by: Helm
{{- end }}