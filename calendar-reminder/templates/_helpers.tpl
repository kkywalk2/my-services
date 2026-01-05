{{/*
Expand the name of the chart.
*/}}
{{- define "calendar-reminder.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "calendar-reminder.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "calendar-reminder.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "calendar-reminder.labels" -}}
helm.sh/chart: {{ include "calendar-reminder.chart" . }}
{{ include "calendar-reminder.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "calendar-reminder.selectorLabels" -}}
app.kubernetes.io/name: {{ include "calendar-reminder.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Web selector labels
*/}}
{{- define "calendar-reminder.webSelectorLabels" -}}
{{ include "calendar-reminder.selectorLabels" . }}
app.kubernetes.io/component: web
{{- end }}

{{/*
Worker selector labels
*/}}
{{- define "calendar-reminder.workerSelectorLabels" -}}
{{ include "calendar-reminder.selectorLabels" . }}
app.kubernetes.io/component: worker
{{- end }}
