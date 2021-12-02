# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#tfsec:ignore:AZU007
#tfsec:ignore:AZU008
#tfsec:ignore:AZU009
#tfsec:ignore:GEN001
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "4.13.0"

  resource_group_name  = azurerm_resource_group.aks.name
  vnet_subnet_id       = data.azurerm_subnet.nodes.id
  cluster_name         = var.cluster_name
  prefix               = var.prefix
  kubernetes_version   = var.kubernetes_version
  orchestrator_version = var.kubernetes_version

  tags = var.tags

  private_cluster_enabled = var.private_cluster_enabled

  network_plugin = var.network_plugin
  network_policy = var.network_policy

  # net_profile_pod_cidr           = var.net_profile_pod_cidr
  net_profile_service_cidr       = var.net_profile_service_cidr
  net_profile_dns_service_ip     = var.net_profile_dns_service_ip
  net_profile_docker_bridge_cidr = var.net_profile_docker_bridge_cidr

  public_ssh_key = var.public_ssh_key

  enable_role_based_access_control = false
  # rbac_aad_managed                 = false
  # rbac_aad_admin_group_object_ids  = var.admin_group_object_ids

  enable_log_analytics_workspace  = false
  enable_auto_scaling             = var.enable_auto_scaling
  enable_kube_dashboard           = var.enable_kube_dashboard
  enable_azure_policy             = var.enable_azure_policy
  enable_http_application_routing = var.enable_http_application_routing
  # TODO: AKS: Ingress Application Gateway
  # labels: kind/feature, priority/high, lifecycle/frozen, area/terraform, cloud/azure
  # https://github.com/Azure/terraform-azurerm-aks/pull/99
  # enable_ingress_application_gateway = true
  # ingress_application_gateway_gateway_name =
  # ingress_application_gateway_subnet_cidr =
  # ingress_application_gateway_subnet_id =

  os_disk_size_gb           = var.os_disk_size_gb
  agents_min_count          = var.agents_min_count
  agents_max_count          = var.agents_max_count
  agents_count              = var.agents_count
  agents_max_pods           = var.agents_max_pods
  agents_pool_name          = var.agents_pool_name
  agents_availability_zones = var.agents_availability_zones
  agents_type               = var.agents_type
  agents_size               = var.agents_size
  agents_labels             = var.agents_labels
  agents_tags               = var.agents_tags

  # TODO: AKS maintenance windows
  # labels: kind/feature, priority/high, lifecycle/frozen, area/terraform, cloud/azure
  # https://github.com/Azure/terraform-azurerm-aks/pull/133
  # enable_maintenance_window = true
  # maintenance_allowed       = var.maintenance_allowed
  # maintenance_not_allowed   = var.maintenance_not_allowed

  # TODO: AKS: Authorized IP ranges
  # labels: kind/feature, priority/high, lifecycle/frozen, area/terraform, cloud/azure
  # https://github.com/Azure/terraform-azurerm-aks/pull/109
  # api_server_authorized_ip_ranges = var.authorized_ip_ranges

  # TODO: AKS: Another node pools
  # labels: kind/feature, priority/high, lifecycle/frozen, area/terraform, cloud/azure
  # https://github.com/Azure/terraform-azurerm-aks/pull/127
  # node_pools = var.node_pools

  depends_on = [
    azurerm_resource_group.aks
  ]
}
