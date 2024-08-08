# traefik

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/traefik/helm | traefik | 30.0.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafana.folder | string | `"networking"` |  |
| grafanaDashboard.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| ingress.enabled | bool | `false` |  |
| traefik.additionalArguments[0] | string | `"--api.insecure=true"` |  |
| traefik.commonLabels."portefaix.xyz/version" | string | `"v0.54.0"` |  |
| traefik.deployment.kind | string | `"DaemonSet"` |  |
| traefik.gateway.enabled | bool | `true` |  |
| traefik.gateway.name | string | `"traefik"` |  |
| traefik.ingressClass.enabled | bool | `true` |  |
| traefik.ingressClass.isDefaultClass | bool | `false` |  |
| traefik.ingressClass.name | string | `"traefik"` |  |
| traefik.logs.access.enabled | bool | `true` |  |
| traefik.logs.access.format | string | `"json"` |  |
| traefik.logs.general.format | string | `"json"` |  |
| traefik.logs.general.level | string | `"INFO"` |  |
| traefik.metrics.prometheus.addEntryPointsLabels | bool | `true` |  |
| traefik.metrics.prometheus.addRoutersLabels | bool | `true` |  |
| traefik.metrics.prometheus.addServicesLabels | bool | `true` |  |
| traefik.metrics.prometheus.entryPoint | string | `"metrics"` |  |
| traefik.metrics.prometheus.prometheusRule.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| traefik.metrics.prometheus.prometheusRule.enabled | bool | `true` |  |
| traefik.metrics.prometheus.prometheusRule.rules[0].alert | string | `"TraefikTooManyRequests"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[0].expr | string | `"avg(traefik_service_open_connections) > 50"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[0].for | string | `"5m"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[0].labels.severity | string | `"warning"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[1].alert | string | `"TraefikHighHttp4xxErrorRateService"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[1].annotations.description | string | `"Traefik service 4xx error rate is above 5%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[1].annotations.summary | string | `"Traefik high HTTP 4xx error rate service (instance {{ $labels.instance }})"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[1].expr | string | `"sum(rate(traefik_service_requests_total{code=~\"4.*\"}[3m])) by (service) / sum(rate(traefik_service_requests_total[3m])) by (service) * 100 > 5"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[1].for | string | `"5m"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[1].labels.severity | string | `"critical"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[2].alert | string | `"TraefikHighHttp5xxErrorRateService"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[2].annotations.description | string | `"Traefik service 5xx error rate is above 5%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[2].annotations.summary | string | `"Traefik high HTTP 5xx error rate service (instance {{ $labels.instance }})"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[2].expr | string | `"sum(rate(traefik_service_requests_total{code=~\"5.*\"}[3m])) by (service) / sum(rate(traefik_service_requests_total[3m])) by (service) * 100 > 5"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[2].for | string | `"5m"` |  |
| traefik.metrics.prometheus.prometheusRule.rules[2].labels.severity | string | `"critical"` |  |
| traefik.metrics.prometheus.service.enabled | bool | `true` |  |
| traefik.metrics.prometheus.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| traefik.metrics.prometheus.serviceMonitor.enabled | bool | `true` |  |
| traefik.metrics.prometheus.serviceMonitor.honorLabels | bool | `true` |  |
| traefik.metrics.prometheus.serviceMonitor.interval | string | `"30s"` |  |
| traefik.metrics.prometheus.serviceMonitor.jobLabel | string | `"traefik"` |  |
| traefik.metrics.prometheus.serviceMonitor.metricRelabelings | list | `[]` |  |
| traefik.metrics.prometheus.serviceMonitor.relabelings | list | `[]` |  |
| traefik.providers.kubernetesCRD.enabled | bool | `false` |  |
| traefik.providers.kubernetesGateway.enabled | bool | `true` |  |
| traefik.providers.kubernetesIngress.enabled | bool | `true` |  |
| traefik.tracing.otlp.enabled | bool | `false` |  |
| traefik.tracing.otlp.grpc.enable | bool | `false` |  |
| traefik.tracing.otlp.grpc.endpoint | string | `"http://alloy-alloy-traces.opentelemetry.svc.cluster.local:4317"` |  |
| traefik.tracing.otlp.http.enable | bool | `false` |  |
| traefik.tracing.otlp.http.endpoint | string | `"http://alloy-alloy-traces.opentelemetry.svc.cluster.local:4318"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
