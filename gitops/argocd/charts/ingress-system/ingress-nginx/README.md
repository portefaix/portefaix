# ingress-nginx

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://kubernetes.github.io/ingress-nginx | ingress-nginx | 4.9.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafanaDashboard.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| ingress-nginx.commonLabels."portefaix.xyz/version" | string | `"v0.54.0"` |  |
| ingress-nginx.controller.admissionWebhooks.enabled | bool | `false` |  |
| ingress-nginx.controller.allowSnippetAnnotations | bool | `true` |  |
| ingress-nginx.controller.config.custom-http-errors | string | `"401,403,404,500,501,502,503"` |  |
| ingress-nginx.controller.config.log-format-escape-json | string | `"true"` |  |
| ingress-nginx.controller.config.log-format-upstream | string | `"{\"time\": \"$time_iso8601\", \"remote_addr\": \"$proxy_protocol_addr\", \"x_forwarded_for\": \"$proxy_add_x_forwarded_for\", \"request_id\": \"$req_id\", \"remote_user\": \"$remote_user\", \"bytes_sent\": $bytes_sent, \"request_time\": $request_time, \"status\": $status, \"vhost\": \"$host\", \"request_proto\": \"$server_protocol\", \"path\": \"$uri\", \"request_query\": \"$args\", \"request_length\": $request_length, \"duration\": $request_time,\"method\": \"$request_method\", \"http_referrer\": \"$http_referer\", \"http_user_agent\": \"$http_user_agent\"} #magic___^_^___line"` |  |
| ingress-nginx.controller.extraEnvs[0].name | string | `"TZ"` |  |
| ingress-nginx.controller.extraEnvs[0].value | string | `"Europe/Paris"` |  |
| ingress-nginx.controller.ingressClass | string | `"nginx"` |  |
| ingress-nginx.controller.ingressClassResource.name | string | `"nginx"` |  |
| ingress-nginx.controller.kind | string | `"DaemonSet"` | Use a `DaemonSet` or `Deployment` |
| ingress-nginx.controller.metrics.enabled | bool | `true` |  |
| ingress-nginx.controller.metrics.prometheusRule.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| ingress-nginx.controller.metrics.prometheusRule.enabled | bool | `true` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[0].alert | string | `"NGINXConfigFailed"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[0].annotations.description | string | `"bad ingress config - nginx config test failed"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[0].annotations.summary | string | `"uninstall the latest ingress changes to allow config reloads to resume"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[0].expr | string | `"count(nginx_ingress_controller_config_last_reload_successful == 0) > 0"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[0].for | string | `"10s"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[0].labels.severity | string | `"critical"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[1].alert | string | `"NGINXCertificateExpiry"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[1].annotations.description | string | `"ssl certificate(s) will expire in less then a week"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[1].annotations.summary | string | `"renew expiring certificates to avoid downtime"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[1].expr | string | `"(avg(nginx_ingress_controller_ssl_expire_time_seconds) by (host) - time()) < 604800"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[1].for | string | `"10s"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[1].labels.severity | string | `"warning"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[2].alert | string | `"NGINXTooMany500s"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[2].annotations.description | string | `"Too many 5XXs"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[2].annotations.summary | string | `"More than 5% of all requests returned 5XX, this requires your attention"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[2].expr | string | `"100 * ( sum( nginx_ingress_controller_requests{status=~\"5.+\"} ) / sum(nginx_ingress_controller_requests) ) > 5"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[2].for | string | `"1m"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[2].labels.severity | string | `"warning"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[3].alert | string | `"NGINXTooMany400s"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[3].annotations.description | string | `"Too many 4XXs"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[3].annotations.summary | string | `"More than 5% of all requests returned 4XX, this requires your attention"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[3].expr | string | `"100 * ( sum( nginx_ingress_controller_requests{status=~\"4.+\"} ) / sum(nginx_ingress_controller_requests) ) > 5"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[3].for | string | `"1m"` |  |
| ingress-nginx.controller.metrics.prometheusRule.rules[3].labels.severity | string | `"warning"` |  |
| ingress-nginx.controller.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| ingress-nginx.controller.metrics.serviceMonitor.enabled | bool | `true` |  |
| ingress-nginx.defaultBackend.enabled | bool | `true` |  |
| ingress-nginx.defaultBackend.image.extraEnvs[0].name | string | `"TEMPLATE_NAME"` |  |
| ingress-nginx.defaultBackend.image.extraEnvs[0].value | string | `"app-down"` |  |
| ingress-nginx.defaultBackend.image.extraEnvs[1].name | string | `"SHOW_DETAILS"` |  |
| ingress-nginx.defaultBackend.image.extraEnvs[1].value | string | `"true"` |  |
| ingress-nginx.defaultBackend.image.repository | string | `"ghcr.io/tarampampam/error-pages"` |  |
| ingress-nginx.defaultBackend.image.tag | string | `"2.27.0"` |  |
| ingress-nginx.serviceAccount.create | bool | `true` |  |
| ingress-nginx.serviceAccount.name | string | `"ingress-nginx"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
