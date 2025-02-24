{{/*
Expand the name of the chart.
*/}}
{{- define "pod3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pod3.fullname" -}}
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
{{- define "pod3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

# {{/*
# Service labels
# */}}
# {{- define "pod3.pod3Labels" -}}
# {{- if and .Values.service (hasKey .Values.service "pod3Labels") }}
# {{- with .Values.service.pod3Labels }}
# {{- range $key, $value := . }}
# {{ $key }}: {{ $value }}
# {{- end }}
# {{- end }}
# {{- end }}
# {{- end }}

{{/*
Selector labels
*/}}
# {{- define "pod3.selectorLabels" -}}
# app.kubernetes.io/name: {{ include "pod3.name" . }}
# app.kubernetes.io/component: pod3
# app.kubernetes.io/instance: {{ .Release.Name }}
# {{- end }}