{{/*
Expand the name of the chart.
*/}}
{{- define "pricebuddy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pricebuddy.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create scraper and version as used by the chart label.
*/}}
{{- define "scraper.name" -}}
{{- printf "%s-%s" (include "pricebuddy.name" .) .Values.scraper.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "scraper.fullname" -}}
{{- printf "%s-%s" (include "pricebuddy.fullname" .) .Values.scraper.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the name of the default secret
*/}}
{{- define "pricebuddy.secret-name" -}}
{{- if .Values.pricebuddy.existingSecret -}}
{{- .Values.pricebuddy.existingSecret -}}
{{- else -}}
{{- include "pricebuddy.name" . -}}
{{- end -}}
{{- end -}}
