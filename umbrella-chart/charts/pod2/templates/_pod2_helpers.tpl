{{/*
Expand the name of the chart.
*/}}
{{- define "pod2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pod2.fullname" -}}
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
{{- define "pod2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Common labels
*/}}
# {{- define "pod2.labels" -}}
# helm.sh/chart: {{ include "pod2.chart" . }}
# {{- if .Chart.AppVersion }}
# app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
# {{- end }}
# app.kubernetes.io/managed-by: {{ .Release.Service }}
# {{- end }}

{{/*
Service labels
*/}}
{{- define "pod2.pod2Labels" -}}
{{- if and .Values.service (hasKey .Values.service "pod2Labels") }}
{{- with .Values.service.pod2Labels }}
{{- range $key, $value := . }}
{{ $key }}: {{ $value }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
# {{- define "pod2.selectorLabels" -}}
# app.kubernetes.io/name: {{ include "pod2.name" . }}
# app.kubernetes.io/component: pod2
# app.kubernetes.io/instance: {{ .Release.Name }}
# {{- end }}
