{{/*
Expand the name of the chart.
*/}}
{{- define "pod4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pod4.fullname" -}}
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
{{- define "pod4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Service labels
*/}}
{{- define "pod4.pod4Labels" -}}
{{- if and .Values.service (hasKey .Values.service "pod4Labels") }}
{{- with .Values.service.pod4Labels }}
{{- range $key, $value := . }}
{{ $key }}: {{ $value }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Selector labels
*/}}
# {{- define "pod4.selectorLabels" -}}
# app.kubernetes.io/name: {{ include "pod4.name" . }}
# app.kubernetes.io/component: pod4
# app.kubernetes.io/instance: {{ .Release.Name }}
# {{- end }}