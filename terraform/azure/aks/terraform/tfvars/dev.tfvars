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

#############################################################################
# Provider

resource_group_name     = "portefaix-dev"
resource_group_location = "West Europe"

#############################################################################
# Networking

virtual_network_name     = "portefaix-dev"
vnet_resource_group_name = "portefaix-dev-vnet"
subnet_name              = "portefaix-dev-aks-nodes"

#############################################################################
# Active Directory

# aad_group_name = "portefaix-dev-aks"

#############################################################################
# AKS

cluster_name = "portefaix-dev-aks"

cluster_location = "francecentral"

kubernetes_version = "1.18.10"

# rbac = true
pod_security_policy = false

tags = {
  "env"     = "dev"
  "project" = "portefaix"
  "service" = "kubernetes"
  "made-by" = "terraform"
}

#############################################################################
# Default node pool

node_count              = 2
node_vm_size            = "Standard_D2s_v3"
os_disk_size_gb         = 50
enable_auto_scaling     = true
node_min_count          = 1
node_max_count          = 4
node_max_pods           = 110
node_availability_zones = [1, 2, 3]
node_taints             = []
node_labels = {
  "service" = "kubernetes"
  "env"     = "dev"
  "project" = "portefaix"
}

#############################################################################
# Network profile

network_plugin = "azure"
network_policy = "calico"
# pod_cidr       = "10.0.16.0/20"
service_cidr       = "10.0.32.0/20"
dns_service_ip     = "10.0.32.10"
docker_bridge_cidr = "172.0.0.1/8"

#############################################################################
# Addon profile

http_application_routing = false
kube_dashboard           = false
aci_connector_linux      = false
azure_policy             = false

#############################################################################
# Auto-scaler profile

#############################################################################
# Addons node pool

node_pools = [
  {
    name                = "spot"
    vm_size             = "Standard_D2s_v3"
    os_disk_size_gb     = 50
    enable_auto_scaling = true
    node_count          = 0
    min_count           = 0
    max_count           = 4
    max_pods            = 110
    node_labels = {
      "kubernetes.azure.com/scalesetpriority" = "spot"
    },
    node_taints = [
      "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
    ],
  }
]
