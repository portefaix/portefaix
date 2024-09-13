# tempo

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/grafana/helm-charts | tempo-distributed | 1.15.1 |
| oci://ghcr.io/portefaix/charts | tempo-mixin | 1.7.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingress.enabled | bool | `false` |  |
| tempo-distributed.compactor.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| tempo-distributed.compactor.replicas | int | `1` |  |
| tempo-distributed.distributor.config.log_received_spans.enabled | bool | `true` |  |
| tempo-distributed.distributor.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| tempo-distributed.distributor.replicas | int | `1` |  |
| tempo-distributed.gateway.enabled | bool | `true` |  |
| tempo-distributed.gateway.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| tempo-distributed.gateway.nginxConfig.logFormat | string | `"main escape=json '{\"source\": \"nginx\", \"level\": \"info\", \"time\": $msec, \"resp_body_size\": $body_bytes_sent, \"host\": \"$http_host\", \"address\": \"$remote_addr\", \"request_length\": $request_length, \"method\": \"$request_method\", \"uri\": \"$request_uri\", \"status\": $status,  \"user_agent\": \"$http_user_agent\", \"resp_time\": $request_time, \"upstream_addr\": \"$upstream_addr\"}';"` |  |
| tempo-distributed.gateway.replicas | int | `1` |  |
| tempo-distributed.ingester.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| tempo-distributed.ingester.replicas | int | `3` |  |
| tempo-distributed.memcached.enabled | bool | `true` |  |
| tempo-distributed.memcached.replicas | int | `1` |  |
| tempo-distributed.memcachedExporter.enabled | bool | `true` |  |
| tempo-distributed.metaMonitoring.grafanaAgent.enabled | bool | `false` |  |
| tempo-distributed.metaMonitoring.grafanaAgent.installOperator | bool | `false` |  |
| tempo-distributed.metaMonitoring.serviceMonitor.enabled | bool | `true` |  |
| tempo-distributed.metaMonitoring.serviceMonitor.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| tempo-distributed.metricsGenerator.config.storage.remote_write[0].url | string | `"http://kube-prometheus-stack-prometheus:9090/api/v1/write"` |  |
| tempo-distributed.metricsGenerator.enabled | bool | `false` |  |
| tempo-distributed.metricsGenerator.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| tempo-distributed.prometheusRule.enabled | bool | `false` |  |
| tempo-distributed.prometheusRule.labels."prometheus.io/operator" | string | `"portefaix"` |  |
| tempo-distributed.querier.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| tempo-distributed.querier.replicas | int | `1` |  |
| tempo-distributed.queryFrontend.extraArgs[0] | string | `"-config.expand-env=true"` |  |
| tempo-distributed.queryFrontend.replicas | int | `1` |  |
| tempo-distributed.reportingEnabled | bool | `false` |  |
| tempo-distributed.search.enabled | bool | `true` |  |
| tempo-distributed.server.logFormat | string | `"json"` |  |
| tempo-distributed.server.logLevel | string | `"info"` |  |
| tempo-distributed.serviceAccount.name | string | `"tempo"` |  |
| tempo-distributed.traces.jaeger.grpc.enabled | bool | `true` | Enable Tempo to ingest Jaeger GRPC traces |
| tempo-distributed.traces.jaeger.grpc.receiverConfig | object | `{}` | Jaeger GRPC receiver config |
| tempo-distributed.traces.jaeger.thriftBinary.enabled | bool | `true` | Enable Tempo to ingest Jaeger Thrift Binary traces |
| tempo-distributed.traces.jaeger.thriftBinary.receiverConfig | object | `{}` | Jaeger Thrift Binary receiver config |
| tempo-distributed.traces.jaeger.thriftCompact.enabled | bool | `true` | Enable Tempo to ingest Jaeger Thrift Compact traces |
| tempo-distributed.traces.jaeger.thriftCompact.receiverConfig | object | `{}` | Jaeger Thrift Compact receiver config |
| tempo-distributed.traces.jaeger.thriftHttp.enabled | bool | `true` | Enable Tempo to ingest Jaeger Thrift HTTP traces |
| tempo-distributed.traces.jaeger.thriftHttp.receiverConfig | object | `{}` | Jaeger Thrift HTTP receiver config |
| tempo-distributed.traces.kafka | object | `{}` | Enable Tempo to ingest traces from Kafka. Reference: https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/kafkareceiver |
| tempo-distributed.traces.opencensus.enabled | bool | `false` | Enable Tempo to ingest Open Census traces |
| tempo-distributed.traces.opencensus.receiverConfig | object | `{}` | Open Census receiver config |
| tempo-distributed.traces.otlp.grpc.enabled | bool | `true` | Enable Tempo to ingest Open Telemetry GRPC traces |
| tempo-distributed.traces.otlp.grpc.receiverConfig | object | `{}` | GRPC receiver advanced config |
| tempo-distributed.traces.otlp.http.enabled | bool | `true` | Enable Tempo to ingest Open Telemetry HTTP traces |
| tempo-distributed.traces.otlp.http.receiverConfig | object | `{}` | HTTP receiver advanced config |
| tempo-distributed.traces.zipkin.enabled | bool | `false` | Enable Tempo to ingest Zipkin traces |
| tempo-distributed.traces.zipkin.receiverConfig | object | `{}` | Zipkin receiver config |
| tempo-mixin.additionalLabels."portefaix.xyz/version" | string | `"v0.54.0"` |  |
| tempo-mixin.grafanaDashboard.enabled | bool | `true` |  |
| tempo-mixin.grafanaDashboard.folder | string | `"tracing"` |  |
| tempo-mixin.grafanaDashboard.grafanaOperator.allowCrossNamespaceImport | bool | `true` |  |
| tempo-mixin.grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| tempo-mixin.grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| tempo-mixin.monitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
