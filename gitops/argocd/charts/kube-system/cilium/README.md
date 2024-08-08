# cilium

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://helm.cilium.io | cilium | 1.15.6 |
| oci://ghcr.io/portefaix/charts | cilium-mixin | 0.3.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cilium-mixin.grafanaDashboard.enabled | bool | `true` |  |
| cilium-mixin.grafanaDashboard.folder | string | `"networking"` |  |
| cilium-mixin.grafanaDashboard.grafanaOperator.allowCrossNamespaceImport | bool | `true` |  |
| cilium-mixin.grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| cilium-mixin.grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| cilium.dashboards.annotations."grafana.com/folder" | string | `"networking"` |  |
| cilium.dashboards.enabled | bool | `true` |  |
| cilium.dashboards.label | string | `"grafana.com/dashboard"` |  |
| cilium.debug.enabled | bool | `true` |  |
| cilium.debug.verbose | string | `"datapath flow"` |  |
| cilium.endpointRoutes.enabled | bool | `true` |  |
| cilium.hubble.enabled | bool | `true` |  |
| cilium.hubble.metrics.dashboards.annotations."grafana.com/folder" | string | `"networking"` |  |
| cilium.hubble.metrics.dashboards.enabled | bool | `true` |  |
| cilium.hubble.metrics.dashboards.label | string | `"grafana.com/dashboard"` |  |
| cilium.hubble.metrics.enableOpenMetrics | bool | `true` |  |
| cilium.hubble.metrics.enabled[0] | string | `"dns"` |  |
| cilium.hubble.metrics.enabled[1] | string | `"drop"` |  |
| cilium.hubble.metrics.enabled[2] | string | `"tcp"` |  |
| cilium.hubble.metrics.enabled[3] | string | `"icmp"` |  |
| cilium.hubble.metrics.enabled[4] | string | `"policy:sourceContext=app|workload-name|pod|reserved-identity;destinationContext=app|workload-name|pod|dns|reserved-identity;labelsContext=source_namespace,destination_namespace"` |  |
| cilium.hubble.metrics.enabled[5] | string | `"flow:sourceContext=workload-name|reserved-identity;destinationContext=workload-name|reserved-identity"` |  |
| cilium.hubble.metrics.enabled[6] | string | `"kafka:labelsContext=source_namespace,source_workload,destination_namespace,destination_workload,traffic_direction;sourceContext=workload-name|reserved-identity;destinationContext=workload-name|reserved-identity"` |  |
| cilium.hubble.metrics.enabled[7] | string | `"httpV2:exemplars=true;sourceContext=workload-name|pod-name|reserved-identity;destinationContext=workload-name|pod-name|reserved-identity;labelsContext=source_namespace,destination_namespace,traffic_direction"` |  |
| cilium.hubble.metrics.serviceMonitor.enabled | bool | `true` |  |
| cilium.hubble.metrics.serviceMonitor.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| cilium.hubble.relay.enabled | bool | `true` |  |
| cilium.hubble.relay.prometheus.enabled | bool | `true` |  |
| cilium.hubble.relay.prometheus.serviceMonitor.enabled | bool | `true` |  |
| cilium.hubble.relay.prometheus.serviceMonitor.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| cilium.hubble.ui.enabled | bool | `true` |  |
| cilium.logOptions.format | string | `"json"` |  |
| cilium.operator.dashboards.annotations."grafana.com/folder" | string | `"networking"` |  |
| cilium.operator.dashboards.enabled | bool | `true` |  |
| cilium.operator.dashboards.label | string | `"grafana.com/dashboard"` |  |
| cilium.operator.enabled | bool | `true` |  |
| cilium.operator.prometheus.enabled | bool | `true` |  |
| cilium.operator.prometheus.serviceMonitor.enabled | bool | `true` |  |
| cilium.operator.prometheus.serviceMonitor.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| cilium.prometheus.enabled | bool | `true` |  |
| cilium.prometheus.serviceMonitor.enabled | bool | `true` |  |
| cilium.prometheus.serviceMonitor.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| grafanaDashboard.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[0].folder | string | `"networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[0].name | string | `"cilium-operator-dashboard"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[1].folder | string | `"networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[1].name | string | `"cilium-dashboard"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[2].folder | string | `"networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[2].name | string | `"hubble-dashboard"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[3].folder | string | `"networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[3].name | string | `"hubble-dns-namespace"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[4].folder | string | `"networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[4].name | string | `"hubble-l7-http-metrics-by-workload"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[5].folder | string | `"networking"` |  |
| grafanaDashboard.grafanaOperator.existingDashboards[5].name | string | `"hubble-network-overview-namespace"` |  |
| grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| ingress.enabled | bool | `false` |  |
| monitoring.enabled | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
