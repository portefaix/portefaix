# loki

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | loki | 6.8.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alerting.dashboard_url | string | `""` |  |
| alerting.runbook_url | string | `""` |  |
| enterprise.enabled | bool | `false` |  |
| grafanaDashboard.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[0].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[0].key | string | `"loki-chunks.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[0].name | string | `"loki-dashboards-1"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[1].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[1].key | string | `"loki-deletion.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[1].name | string | `"loki-dashboards-1"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[2].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[2].key | string | `"loki-logs.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[2].name | string | `"loki-dashboards-1"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[3].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[3].key | string | `"loki-mixin-recording-rules.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[3].name | string | `"loki-dashboards-1"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[4].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[4].key | string | `"loki-operational.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[4].name | string | `"loki-dashboards-1"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[5].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[5].key | string | `"loki-reads.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[5].name | string | `"loki-dashboards-2"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[6].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[6].key | string | `"loki-reads-resources.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[6].name | string | `"loki-dashboards-2"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[7].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[7].key | string | `"loki-writes.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[7].name | string | `"loki-dashboards-2"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[8].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[8].key | string | `"loki-writes-resources.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[8].name | string | `"loki-dashboards-2"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[9].folder | string | `"logging"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[9].key | string | `"loki-retention.json"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[9].name | string | `"loki-dashboards-2"` |  |
| grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| ingress.enabled | bool | `false` |  |
| loki.backend.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| loki.backend.extraArgs[1] | string | `"-log.format=json"` |  |
| loki.backend.extraArgs[2] | string | `"-log.level=info"` |  |
| loki.gateway.enabled | bool | `true` |  |
| loki.gateway.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| loki.gateway.extraArgs[1] | string | `"-log.format=json"` |  |
| loki.gateway.extraArgs[2] | string | `"-log.level=info"` |  |
| loki.gateway.nginxConfig.logFormat | string | `"main escape=json '{\"source\": \"nginx\", \"level\": \"info\", \"time\": $msec, \"resp_body_size\": $body_bytes_sent, \"host\": \"$http_host\", \"address\": \"$remote_addr\", \"request_length\": $request_length, \"method\": \"$request_method\", \"uri\": \"$request_uri\", \"status\": $status,  \"user_agent\": \"$http_user_agent\", \"resp_time\": $request_time, \"upstream_addr\": \"$upstream_addr\"}';"` |  |
| loki.loki.auth_enabled | bool | `false` |  |
| loki.lokiCanary.enabled | bool | `false` |  |
| loki.minio.enabled | bool | `false` |  |
| loki.monitoring.dashboards.annotations."grafana.com/folder" | string | `"logging"` |  |
| loki.monitoring.dashboards.enabled | bool | `true` |  |
| loki.monitoring.dashboards.labels."grafana.com/dashboard" | string | `"loki"` |  |
| loki.monitoring.lokiCanary.enabled | bool | `false` |  |
| loki.monitoring.rules.alerting | bool | `true` |  |
| loki.monitoring.rules.enabled | bool | `true` |  |
| loki.monitoring.rules.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| loki.monitoring.selfMonitoring.enabled | bool | `false` |  |
| loki.monitoring.selfMonitoring.grafanaAgent.installOperator | bool | `false` |  |
| loki.monitoring.serviceMonitor.enabled | bool | `true` |  |
| loki.monitoring.serviceMonitor.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| loki.monitoring.serviceMonitor.metricsInstance.enabled | bool | `false` |  |
| loki.networkPolicy.enabled | bool | `false` |  |
| loki.read.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| loki.read.extraArgs[1] | string | `"-log.format=json"` |  |
| loki.read.extraArgs[2] | string | `"-log.level=info"` |  |
| loki.serviceAccount.create | bool | `true` |  |
| loki.serviceAccount.name | string | `"loki"` |  |
| loki.sidecar.enableUniqueFilenames | bool | `true` |  |
| loki.sidecar.rules.enabled | bool | `true` |  |
| loki.sidecar.rules.folder | string | `"/var/loki/rules/fake"` |  |
| loki.sidecar.rules.label | string | `"loki-rule"` |  |
| loki.sidecar.rules.labelValue | string | `""` |  |
| loki.sidecar.rules.logLevel | string | `"info"` |  |
| loki.sidecar.rules.searchNamespace | string | `"ALL"` |  |
| loki.singleBinary.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| loki.singleBinary.extraArgs[1] | string | `"-log.format=json"` |  |
| loki.singleBinary.extraArgs[2] | string | `"-log.level=info"` |  |
| loki.tableManager.enabled | bool | `false` |  |
| loki.test.enabled | bool | `false` |  |
| loki.write.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| loki.write.extraArgs[1] | string | `"-log.format=json"` |  |
| loki.write.extraArgs[2] | string | `"-log.level=info"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
