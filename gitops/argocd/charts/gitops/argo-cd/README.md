# argo-cd

![Version: 1.3.0](https://img.shields.io/badge/Version-1.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/argoproj/argo-helm | argo-cd | 6.11.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| argo-cd.applicationSet.metrics.enabled | bool | `true` |  |
| argo-cd.applicationSet.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| argo-cd.applicationSet.metrics.serviceMonitor.enabled | bool | `true` |  |
| argo-cd.configs.cm."admin.enabled" | bool | `true` |  |
| argo-cd.configs.cm."application.instanceLabelKey" | string | `"argocd.argoproj.io/instance"` |  |
| argo-cd.configs.cm."exec.enabled" | bool | `true` |  |
| argo-cd.configs.cm."resource.customizations.health.bitnami.com_SealedSecret" | string | `"hs = {}\nhs.status = \"Healthy\"\nhs.message = \"Controller doesn't report resource status\"\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.customizations.health.cert-manager.io_Certificate" | string | `"hs = {}\nif obj.status ~= nil then\n  if obj.status.conditions ~= nil then\n    for i, condition in ipairs(obj.status.conditions) do\n      if condition.type == \"Ready\" and condition.status == \"False\" then\n        hs.status = \"Degraded\"\n        hs.message = condition.message\n        return hs\n      end\n      if condition.type == \"Ready\" and condition.status == \"True\" then\n        hs.status = \"Healthy\"\n        hs.message = condition.message\n        return hs\n      end\n    end\n  end\nend\nhs.status = \"Progressing\"\nhs.message = \"Waiting for certificate\"\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.customizations.health.certmanager.k8s.io-Certificate" | string | `"hs = {}\nif obj.status ~= nil then\n  if obj.status.conditions ~= nil then\n    for i, condition in ipairs(obj.status.conditions) do\n      if condition.type == \"Ready\" and condition.status == \"False\" then\n        hs.status = \"Degraded\"\n        hs.message = condition.message\n        return hs\n      end\n      if condition.type == \"Ready\" and condition.status == \"True\" then\n        hs.status = \"Healthy\"\n        hs.message = condition.message\n        return hs\n      end\n    end\n  end\nend\nhs.status = \"Progressing\"\nhs.message = \"Waiting for certificate\"\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.customizations.health.lifecycle.keptn.sh_KeptnAppVersion" | string | `"hs = {}\nhs.status = \"Progressing\"\nhs.message = \"KeptnAppVersion is progressing\"\nif obj.status.status == \"Succeeded\" then\n  hs.status = \"Healthy\"\n  hs.message = \"KeptnAppVersion is healthy\"\nend\nif obj.status.status == \"Failed\" then\n  hs.status = \"Degraded\"\n  hs.message = \"KeptnAppVersion is degraded\"\nend\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.customizations.health.lifecycle.keptn.sh_KeptnEvaluation" | string | `"hs = {}\nhs.status = \"Progressing\"\nhs.message = \"KeptnEvaluation is progressing\"\nif obj.status.overallStatus == \"Succeeded\" then\n  hs.status = \"Healthy\"\n  hs.message = \"KeptnEvaluation is healthy\"\nend\nif obj.status.overallStatus == \"Failed\" then\n  hs.status = \"Degraded\"\n  hs.message = \"KeptnEvaluation is degraded\"\nend\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.customizations.health.lifecycle.keptn.sh_KeptnTask" | string | `"hs = {}\nhs.status = \"Progressing\"\nhs.message = \"KeptnTask is progressing\"\nif obj.status.status == \"Succeeded\" then\n  hs.status = \"Healthy\"\n  hs.message = \"KeptnTask is healthy\"\nend\nif obj.status.status == \"Failed\" then\n  hs.status = \"Degraded\"\n  hs.message = \"KeptnTask is degraded\"\nend\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.customizations.health.lifecycle.keptn.sh_KeptnWorkloadInstance" | string | `"hs = {}\nhs.status = \"Progressing\"\nhs.message = \"KeptnWorkloadInstance is progressing\"\nif obj.status.status == \"Succeeded\" then\n  hs.status = \"Healthy\"\n  hs.message = \"KeptnWorkloadInstance is healthy\"\nend\nif obj.status.status == \"Failed\" then\n  hs.status = \"Degraded\"\n  hs.message = \"KeptnWorkloadInstance is degraded\"\nend\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.customizations.health.networking.k8s.io_Ingress" | string | `"hs = {}\nhs.status = \"Healthy\"\nreturn hs\n"` |  |
| argo-cd.configs.cm."resource.exclusions" | string | `"- apiGroups:\n    - cilium.io\n  kinds:\n    - CiliumIdentity\n  clusters:\n    - \"*\"\n"` |  |
| argo-cd.configs.cm."server.rbac.log.enforce.enable" | bool | `true` |  |
| argo-cd.configs.cm."statusbadge.enabled" | bool | `true` |  |
| argo-cd.configs.cm."timeout.reconciliation" | string | `"180s"` |  |
| argo-cd.configs.params."controller.operation.processors" | int | `20` | Number of application operation processors |
| argo-cd.configs.params."controller.repo.server.timeout.seconds" | int | `180` | Repo server RPC call timeout seconds. |
| argo-cd.configs.params."controller.self.heal.timeout.seconds" | int | `15` | Specifies timeout between application self heal attempts |
| argo-cd.configs.params."controller.status.processors" | int | `20` | Number of application status processors |
| argo-cd.configs.params."server.insecure" | bool | `true` | Run server without TLS |
| argo-cd.controller.metrics.enabled | bool | `true` |  |
| argo-cd.controller.metrics.rules.enabled | bool | `true` |  |
| argo-cd.controller.metrics.rules.spec[0].alert | string | `"ArgoAppMissing"` |  |
| argo-cd.controller.metrics.rules.spec[0].annotations.description | string | `"Argo CD has not reported any applications data for the past 15 minutes which means that it must be down or not functioning properly.  This needs to be resolved for this cloud to continue to maintain state.\n"` |  |
| argo-cd.controller.metrics.rules.spec[0].annotations.summary | string | `"Argo CD: No reported applications"` |  |
| argo-cd.controller.metrics.rules.spec[0].expr | string | `"absent(argocd_app_info)\n"` |  |
| argo-cd.controller.metrics.rules.spec[0].for | string | `"15m"` |  |
| argo-cd.controller.metrics.rules.spec[0].labels.severity | string | `"warning"` |  |
| argo-cd.controller.metrics.rules.spec[1].alert | string | `"ArgoAppSyncStateOutOfSync"` |  |
| argo-cd.controller.metrics.rules.spec[1].annotations.description | string | `"The ArgoCD application {{ \"{{\" }} $labels.name {{ \"}}\" }} needs to be synced"` |  |
| argo-cd.controller.metrics.rules.spec[1].annotations.summary | string | `"An ArgoCD applications SyncState is OutOfSync for a unusally long time"` |  |
| argo-cd.controller.metrics.rules.spec[1].expr | string | `"sum(argocd_app_info{sync_status=\"Unknown\"}) >= 1"` |  |
| argo-cd.controller.metrics.rules.spec[1].for | string | `"15m"` |  |
| argo-cd.controller.metrics.rules.spec[1].labels.severity | string | `"warning"` |  |
| argo-cd.controller.metrics.rules.spec[2].alert | string | `"ArgoAppSyncStateUnknown"` |  |
| argo-cd.controller.metrics.rules.spec[2].annotations.description | string | `"The ArgoCD application {{ \"{{\" }} $labels.name {{ \"}}\" }} needs to be checked/validated"` |  |
| argo-cd.controller.metrics.rules.spec[2].annotations.summary | string | `"An ArgoCD applications SyncState is Unknown for a unusally long time"` |  |
| argo-cd.controller.metrics.rules.spec[2].expr | string | `"sum(argocd_app_info{sync_status=\"OutOfSync\"}) >= 1"` |  |
| argo-cd.controller.metrics.rules.spec[2].for | string | `"15m"` |  |
| argo-cd.controller.metrics.rules.spec[2].labels.severity | string | `"warning"` |  |
| argo-cd.controller.metrics.rules.spec[3].alert | string | `"ArgoAppHealthStateUnhealthy"` |  |
| argo-cd.controller.metrics.rules.spec[3].annotations.description | string | `"The ArgoCD application {{ \"{{\" }} $labels.name {{ \"}}\" }} is not getting in to a healthy state even after enough reconciliation time"` |  |
| argo-cd.controller.metrics.rules.spec[3].annotations.summary | string | `"An ArgoCD applications HealthState is not Healthy for an unsually long time"` |  |
| argo-cd.controller.metrics.rules.spec[3].expr | string | `"sum(argocd_app_info{health_status!=\"Healthy\"}) >= 1"` |  |
| argo-cd.controller.metrics.rules.spec[3].for | string | `"15m"` |  |
| argo-cd.controller.metrics.rules.spec[3].labels.severity | string | `"warning"` |  |
| argo-cd.controller.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| argo-cd.controller.metrics.serviceMonitor.enabled | bool | `true` |  |
| argo-cd.dex.metrics.enabled | bool | `true` |  |
| argo-cd.dex.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| argo-cd.dex.metrics.serviceMonitor.enabled | bool | `true` |  |
| argo-cd.global.additionalLabels."portefaix.xyz/version" | string | `"v0.54.0"` |  |
| argo-cd.global.logging.format | string | `"json"` |  |
| argo-cd.global.logging.level | string | `"info"` |  |
| argo-cd.global.securityContext.fsGroup | int | `999` |  |
| argo-cd.global.securityContext.runAsGroup | int | `999` |  |
| argo-cd.global.securityContext.runAsUser | int | `999` |  |
| argo-cd.notifications.bots.slack.enabled | bool | `false` |  |
| argo-cd.notifications.bots.slack.service.type | string | `"ClusterIP"` |  |
| argo-cd.notifications.metrics.enabled | bool | `true` |  |
| argo-cd.notifications.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| argo-cd.notifications.metrics.serviceMonitor.enabled | bool | `true` |  |
| argo-cd.notifications.notifiers."service.grafana" | string | `"apiUrl: https://grafana.example.com/api\napiKey: $grafana-argo-cd-token\n"` |  |
| argo-cd.notifications.notifiers."service.slack" | string | `"token: $slack-token\n"` |  |
| argo-cd.notifications.secret.create | bool | `false` |  |
| argo-cd.notifications.secret.name | string | `"argocd-notifications-secret"` |  |
| argo-cd.notifications.subscriptions[0].recipients[0] | string | `"slack:portefaix-homelab-gitops"` |  |
| argo-cd.notifications.subscriptions[0].triggers[0] | string | `"on-sync-status-unknown"` |  |
| argo-cd.notifications.templates."template.app-created" | string | `"email:\n  subject: Application {{.app.metadata.name}} has been created.\nmessage: Application {{.app.metadata.name}} has been created.\n"` |  |
| argo-cd.notifications.templates."template.app-deleted" | string | `"email:\n  subject: Application {{.app.metadata.name}} has been deleted.\nmessage: Application {{.app.metadata.name}} has been deleted.\n"` |  |
| argo-cd.notifications.templates."template.app-deployed" | string | `"email:\n  subject: New version of an application {{.app.metadata.name}} is up and running.\nmessage: |\n  {{if eq .serviceType \"slack\"}}:white_check_mark:{{end}} Application {{.app.metadata.name}} is now running new version of deployments manifests.\nslack:\n  attachments: |\n    [{\n      \"title\": \"{{ .app.metadata.name}}\",\n      \"title_link\":\"{{.context.argocdUrl}}/applications/{{.app.metadata.name}}\",\n      \"color\": \"#18be52\",\n      \"fields\": [\n      {\n        \"title\": \"Sync Status\",\n        \"value\": \"{{.app.status.sync.status}}\",\n        \"short\": true\n      },\n      {\n        \"title\": \"Repository\",\n        \"value\": \"{{.app.spec.source.repoURL}}\",\n        \"short\": true\n      },\n      {\n        \"title\": \"Revision\",\n        \"value\": \"{{.app.status.sync.revision}}\",\n        \"short\": true\n      }\n      {{range $index, $c := .app.status.conditions}}\n      {{if not $index}},{{end}}\n      {{if $index}},{{end}}\n      {\n        \"title\": \"{{$c.type}}\",\n        \"value\": \"{{$c.message}}\",\n        \"short\": true\n      }\n      {{end}}\n      ]\n    }]\n"` |  |
| argo-cd.notifications.templates."template.app-health-degraded" | string | `"email:\n  subject: Application {{.app.metadata.name}} has degraded.\nmessage: |\n  {{if eq .serviceType \"slack\"}}:exclamation:{{end}} Application {{.app.metadata.name}} has degraded.\n  Application details: {{.context.argocdUrl}}/applications/{{.app.metadata.name}}.\nslack:\n  attachments: |-\n    [{\n      \"title\": \"{{ .app.metadata.name}}\",\n      \"title_link\": \"{{.context.argocdUrl}}/applications/{{.app.metadata.name}}\",\n      \"color\": \"#f4c030\",\n      \"fields\": [\n      {\n        \"title\": \"Sync Status\",\n        \"value\": \"{{.app.status.sync.status}}\",\n        \"short\": true\n      },\n      {\n        \"title\": \"Repository\",\n        \"value\": \"{{.app.spec.source.repoURL}}\",\n        \"short\": true\n      }\n      {{range $index, $c := .app.status.conditions}}\n      {{if not $index}},{{end}}\n      {{if $index}},{{end}}\n      {\n        \"title\": \"{{$c.type}}\",\n        \"value\": \"{{$c.message}}\",\n        \"short\": true\n      }\n      {{end}}\n      ]\n    }]\n"` |  |
| argo-cd.notifications.templates."template.app-sync-failed" | string | `"email:\n  subject: Failed to sync application {{.app.metadata.name}}.\nmessage: |\n  {{if eq .serviceType \"slack\"}}:exclamation:{{end}}  The sync operation of application {{.app.metadata.name}} has failed at {{.app.status.operationState.finishedAt}} with the following error: {{.app.status.operationState.message}}\n  Sync operation details are available at: {{.context.argocdUrl}}/applications/{{.app.metadata.name}}?operation=true .\nslack:\n  attachments: |-\n    [{\n      \"title\": \"{{ .app.metadata.name}}\",\n      \"title_link\":\"{{.context.argocdUrl}}/applications/{{.app.metadata.name}}\",\n      \"color\": \"#E96D76\",\n      \"fields\": [\n      {\n        \"title\": \"Sync Status\",\n        \"value\": \"{{.app.status.sync.status}}\",\n        \"short\": true\n      },\n      {\n        \"title\": \"Repository\",\n        \"value\": \"{{.app.spec.source.repoURL}}\",\n        \"short\": true\n      }\n      {{range $index, $c := .app.status.conditions}}\n      {{if not $index}},{{end}}\n      {{if $index}},{{end}}\n      {\n        \"title\": \"{{$c.type}}\",\n        \"value\": \"{{$c.message}}\",\n        \"short\": true\n      }\n      {{end}}\n      ]\n    }]\n"` |  |
| argo-cd.notifications.templates."template.app-sync-running" | string | `"email:\n  subject: Start syncing application {{.app.metadata.name}}.\nmessage: |\n  The sync operation of application {{.app.metadata.name}} has started at {{.app.status.operationState.startedAt}}.\n  Sync operation details are available at: {{.context.argocdUrl}}/applications/{{.app.metadata.name}}?operation=true .\nslack:\n  attachments: |-\n    [{\n      \"title\": \"{{ .app.metadata.name}}\",\n      \"title_link\":\"{{.context.argocdUrl}}/applications/{{.app.metadata.name}}\",\n      \"color\": \"#0DADEA\",\n      \"fields\": [\n      {\n        \"title\": \"Sync Status\",\n        \"value\": \"{{.app.status.sync.status}}\",\n        \"short\": true\n      },\n      {\n        \"title\": \"Repository\",\n        \"value\": \"{{.app.spec.source.repoURL}}\",\n        \"short\": true\n      }\n      {{range $index, $c := .app.status.conditions}}\n      {{if not $index}},{{end}}\n      {{if $index}},{{end}}\n      {\n        \"title\": \"{{$c.type}}\",\n        \"value\": \"{{$c.message}}\",\n        \"short\": true\n      }\n      {{end}}\n      ]\n    }]\n"` |  |
| argo-cd.notifications.templates."template.app-sync-status-unknown" | string | `"email:\n  subject: Application {{.app.metadata.name}} sync status is 'Unknown'\nmessage: |\n  {{if eq .serviceType \"slack\"}}:exclamation:{{end}} Application {{.app.metadata.name}} sync is 'Unknown'.\n  Application details: {{.context.argocdUrl}}/applications/{{.app.metadata.name}}.\n  {{if ne .serviceType \"slack\"}}\n  {{range $c := .app.status.conditions}}\n      * {{$c.message}}\n  {{end}}\n  {{end}}\nslack:\n  attachments: |-\n    [{\n      \"title\": \"{{ .app.metadata.name}}\",\n      \"title_link\":\"{{.context.argocdUrl}}/applications/{{.app.metadata.name}}\",\n      \"color\": \"#E96D76\",\n      \"fields\": [\n      {\n        \"title\": \"Sync Status\",\n        \"value\": \"{{.app.status.sync.status}}\",\n        \"short\": true\n      },\n      {\n        \"title\": \"Repository\",\n        \"value\": \"{{.app.spec.source.repoURL}}\",\n        \"short\": true\n      }\n      {{range $index, $c := .app.status.conditions}}\n      {{if not $index}},{{end}}\n      {{if $index}},{{end}}\n      {\n        \"title\": \"{{$c.type}}\",\n        \"value\": \"{{$c.message}}\",\n        \"short\": true\n      }\n      {{end}}\n      ]\n    }]\n"` |  |
| argo-cd.notifications.templates."template.app-sync-succeeded" | string | `"email:\n  subject: Application {{.app.metadata.name}} has been successfully synced.\nmessage: |\n  {{if eq .serviceType \"slack\"}}:white_check_mark:{{end}} Application {{.app.metadata.name}} has been successfully synced at {{.app.status.operationState.finishedAt}}.\n  Sync operation details are available at: {{.context.argocdUrl}}/applications/{{.app.metadata.name}}?operation=true .\nslack:\n  attachments: |-\n    [{\n      \"title\": \"{{ .app.metadata.name}}\",\n      \"title_link\":\"{{.context.argocdUrl}}/applications/{{.app.metadata.name}}\",\n      \"color\": \"#18be52\",\n      \"fields\": [\n      {\n        \"title\": \"Sync Status\",\n        \"value\": \"{{.app.status.sync.status}}\",\n        \"short\": true\n      },\n      {\n        \"title\": \"Repository\",\n        \"value\": \"{{.app.spec.source.repoURL}}\",\n        \"short\": true\n      }\n      {{range $index, $c := .app.status.conditions}}\n      {{if not $index}},{{end}}\n      {{if $index}},{{end}}\n      {\n        \"title\": \"{{$c.type}}\",\n        \"value\": \"{{$c.message}}\",\n        \"short\": true\n      }\n      {{end}}\n      ]\n    }]\n"` |  |
| argo-cd.notifications.triggers."trigger.on-created" | string | `"- description: Application is created.\n  oncePer: app.metadata.name\n  send:\n  - app-created\n  when: \"true\"\n"` |  |
| argo-cd.notifications.triggers."trigger.on-deleted" | string | `"- description: Application is deleted.\n  oncePer: app.metadata.name\n  send:\n  - app-deleted\n  when: app.metadata.deletionTimestamp != nil\n"` |  |
| argo-cd.notifications.triggers."trigger.on-deployed" | string | `"- description: Application is synced and healthy. Triggered once per commit.\n  oncePer: app.status.operationState?.syncResult?.revision\n  send:\n  - app-deployed\n  when: app.status.operationState != nil and app.status.operationState.phase in ['Succeeded']\n    and app.status.health.status == 'Healthy'\n"` |  |
| argo-cd.notifications.triggers."trigger.on-health-degraded" | string | `"- description: Application has degraded\n  send:\n  - app-health-degraded\n  when: app.status.health.status == 'Degraded'\n"` |  |
| argo-cd.notifications.triggers."trigger.on-sync-failed" | string | `"- description: Application syncing has failed\n  send:\n  - app-sync-failed\n  when: app.status.operationState != nil and app.status.operationState.phase in ['Error',\n    'Failed']\n"` |  |
| argo-cd.notifications.triggers."trigger.on-sync-running" | string | `"- description: Application is being synced\n  send:\n  - app-sync-running\n  when: app.status.operationState != nil and app.status.operationState.phase in ['Running']\n"` |  |
| argo-cd.notifications.triggers."trigger.on-sync-status-unknown" | string | `"- description: Application status is 'Unknown'\n  send:\n  - app-sync-status-unknown\n  when: app.status.sync.status == 'Unknown'\n"` |  |
| argo-cd.notifications.triggers."trigger.on-sync-succeeded" | string | `"- description: Application syncing has succeeded\n  send:\n  - app-sync-succeeded\n  when: app.status.operationState != nil and app.status.operationState.phase in ['Succeeded']\n"` |  |
| argo-cd.notifications.triggers.defaultTriggers | string | `"- on-sync-status-unknown\n"` |  |
| argo-cd.redis.enabled | bool | `true` |  |
| argo-cd.redis.exporter.enabled | bool | `true` |  |
| argo-cd.redis.exporter.env[0].name | string | `"REDIS_EXPORTER_LOG_FORMAT"` |  |
| argo-cd.redis.exporter.env[0].value | string | `"json"` |  |
| argo-cd.redis.exporter.env[1].name | string | `"REDIS_PASSWORD"` |  |
| argo-cd.redis.exporter.env[1].valueFrom.secretKeyRef.key | string | `"auth"` |  |
| argo-cd.redis.exporter.env[1].valueFrom.secretKeyRef.name | string | `"argocd-redis"` |  |
| argo-cd.redis.exporter.image.repository | string | `"oliver006/redis_exporter"` |  |
| argo-cd.redis.exporter.image.tag | string | `"v1.60.0"` |  |
| argo-cd.redis.metrics.enabled | bool | `true` |  |
| argo-cd.redis.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| argo-cd.redis.metrics.serviceMonitor.enabled | bool | `true` |  |
| argo-cd.repoServer.metrics.enabled | bool | `true` |  |
| argo-cd.repoServer.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| argo-cd.repoServer.metrics.serviceMonitor.enabled | bool | `true` |  |
| argo-cd.server.extensions.enabled | bool | `false` |  |
| argo-cd.server.metrics.enabled | bool | `true` |  |
| argo-cd.server.metrics.serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| argo-cd.server.metrics.serviceMonitor.enabled | bool | `true` |  |
| grafana.folder | string | `"gitops"` |  |
| grafanaDashboard.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.enabled | bool | `true` |  |
| grafanaDashboard.grafanaOperator.matchLabels."grafana.com/dashboards" | string | `"portefaix"` |  |
| ingress.enabled | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
