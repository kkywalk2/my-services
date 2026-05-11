{{/*
Expand the name of the chart.
*/}}
{{- define "simple-webdav.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "simple-webdav.fullname" -}}
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
Common labels
*/}}
{{- define "simple-webdav.labels" -}}
helm.sh/chart: {{ include "simple-webdav.name" . }}-{{ .Chart.Version }}
{{ include "simple-webdav.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "simple-webdav.selectorLabels" -}}
app.kubernetes.io/name: {{ include "simple-webdav.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
