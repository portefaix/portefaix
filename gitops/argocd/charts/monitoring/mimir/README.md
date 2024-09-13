# mimir

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | mimir-distributed | 5.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafanaDashboard.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[0].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[0].name | string | `"alertmanager"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[10].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[10].name | string | `"queries"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[11].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[11].name | string | `"reads"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[12].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[12].name | string | `"reads-networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[13].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[13].name | string | `"reads-resources"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[14].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[14].name | string | `"remote-ruler-reads"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[15].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[15].name | string | `"remote-ruler-reads-resources"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[16].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[16].name | string | `"rollout-progress"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[17].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[17].name | string | `"ruler"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[18].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[18].name | string | `"scaling"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[19].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[19].name | string | `"slow-queries"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[1].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[1].name | string | `"alertmanager-resources"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[20].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[20].name | string | `"tenants"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[21].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[21].name | string | `"top-tenants"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[22].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[22].name | string | `"writes"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[23].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[23].name | string | `"writes-networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[24].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[24].name | string | `"writes-resources"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[2].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[2].name | string | `"compactor"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[3].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[3].name | string | `"compactor-resources"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[4].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[4].name | string | `"config"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[5].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[5].name | string | `"object-store"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[6].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[6].name | string | `"overrides"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[7].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[7].name | string | `"overview"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[8].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[8].name | string | `"overview-networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[9].folder | string | `"monitoring"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[9].name | string | `"overview-resources"` |  |
| grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| ingress.enabled | bool | `false` |  |
| mimir-distributed.alertmanager.enabled | bool | `true` |  |
| mimir-distributed.chunks-cache.enabled | bool | `false` |  |
| mimir-distributed.compactor.persistentVolume.enabled | bool | `false` |  |
| mimir-distributed.compactor.resources | object | `{}` |  |
| mimir-distributed.configStorageType | string | `"ConfigMap"` |  |
| mimir-distributed.continuous_test.enabled | bool | `false` |  |
| mimir-distributed.distributor.resources | object | `{}` |  |
| mimir-distributed.externalConfigSecretName | string | `"mimir-configuration"` |  |
| mimir-distributed.externalConfigVersion | string | `"v0"` |  |
| mimir-distributed.gateway.enabledNonEnterprise | bool | `true` |  |
| mimir-distributed.gateway.nginx.config.logFormat | string | `"main escape=json '{\"source\": \"nginx\", \"level\": \"info\", \"time\": $msec, \"resp_body_size\": $body_bytes_sent, \"host\": \"$http_host\", \"address\": \"$remote_addr\", \"request_length\": $request_length, \"method\": \"$request_method\", \"uri\": \"$request_uri\", \"status\": $status,  \"user_agent\": \"$http_user_agent\", \"resp_time\": $request_time, \"upstream_addr\": \"$upstream_addr\"}';"` |  |
| mimir-distributed.gr-aggr-cache.enabled | bool | `false` |  |
| mimir-distributed.gr-metricname-cache.enabled | bool | `false` |  |
| mimir-distributed.graphite.enabled | bool | `false` |  |
| mimir-distributed.index-cache.enabled | bool | `false` |  |
| mimir-distributed.ingester.persistentVolume.enabled | bool | `false` |  |
| mimir-distributed.ingester.resources | object | `{}` |  |
| mimir-distributed.memcachedExporter.enabled | bool | `true` |  |
| mimir-distributed.metaMonitoring.dashboards.annotations."grafana.com/folder" | string | `"monitoring"` |  |
| mimir-distributed.metaMonitoring.dashboards.enabled | bool | `true` |  |
| mimir-distributed.metaMonitoring.dashboards.labels."grafana.com/dashboard" | string | `"monitoring"` |  |
| mimir-distributed.metaMonitoring.grafanaAgent.enabled | bool | `false` |  |
| mimir-distributed.metaMonitoring.grafanaAgent.logs.enabled | bool | `false` |  |
| mimir-distributed.metaMonitoring.grafanaAgent.metrics.enabled | bool | `false` |  |
| mimir-distributed.metaMonitoring.prometheusRule.enabled | bool | `true` |  |
| mimir-distributed.metaMonitoring.prometheusRule.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| mimir-distributed.metaMonitoring.prometheusRule.mimirAlerts | bool | `true` |  |
| mimir-distributed.metaMonitoring.prometheusRule.mimirRules | bool | `true` |  |
| mimir-distributed.metaMonitoring.serviceMonitor.enabled | bool | `true` |  |
| mimir-distributed.metaMonitoring.serviceMonitor.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| mimir-distributed.metadata-cache.enabled | bool | `false` |  |
| mimir-distributed.minio.enabled | bool | `false` |  |
| mimir-distributed.nginx.enabled | bool | `false` |  |
| mimir-distributed.nginx.resources | object | `{}` |  |
| mimir-distributed.overrides_exporter.enabled | bool | `true` |  |
| mimir-distributed.overrides_exporter.resources | object | `{}` |  |
| mimir-distributed.querier.resources | object | `{}` |  |
| mimir-distributed.query_frontend.resources | object | `{}` |  |
| mimir-distributed.query_scheduler.enabled | bool | `true` |  |
| mimir-distributed.results-cache.enabled | bool | `false` |  |
| mimir-distributed.rollout_operator.enabled | bool | `true` |  |
| mimir-distributed.ruler.enabled | bool | `true` |  |
| mimir-distributed.ruler.resources | object | `{}` |  |
| mimir-distributed.serviceAccount.create | bool | `true` |  |
| mimir-distributed.serviceAccount.name | string | `"mimir"` |  |
| mimir-distributed.store_gateway.persistentVolume.enabled | bool | `false` |  |
| mimir-distributed.store_gateway.resources | object | `{}` |  |
| mimir-distributed.useExternalConfig | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
