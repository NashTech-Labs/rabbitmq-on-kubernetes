{{- define "rabbitmq.image" -}}
{{- if not (empty .Values.image) -}}
image: {{ .Values.image }}
{{- end -}}
{{- end -}}

{{ define "rabbitmq.service-annot" }}
{{- with .Values.service -}}
{{- if not (empty .annotations) }}
annotations: {{ toYaml .annotations | nindent 2}}
{{- end }}
{{- end }}
{{- end }}

{{ define "rabbitmq.affinity" }}
{{- if .Values.affinity.enabled }}
affinity:
{{- if not (empty .Values.affinity.nodeAffinity )}}
  nodeAffinity: {{ toYaml .Values.affinity.nodeAffinity | nindent 4 }}
{{- end }}
{{- if not (empty .Values.affinity.podAntiAffinity )}}
  podAntiAffinity: {{ toYaml .Values.affinity.podAntiAffinity | nindent 4 }}
{{- end }}
{{- if not (empty .Values.affinity.podAffinity )}}
  podAffinity: {{ toYaml .Values.affinity.podAffinity | nindent 4 }}
{{- end }}
{{- end }}
{{- end }}

{{ define "rabbitmq.resources" }}
{{- if not (empty .Values.resources) }}
resources: {{ toYaml .Values.resources | nindent 2}}
{{- end }}
{{- end }}