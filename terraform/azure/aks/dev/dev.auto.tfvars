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

aks_resource_group_name     = "portefaix-dev-aks"
aks_resource_group_location = "West Europe"

cluster_name       = "portefaix-dev-aks"
prefix             = "portefaix-dev-aks"
kubernetes_version = "1.21.1"

private_cluster_enabled = false

# rbac = true
# pod_security_policy = false

tags = {
  "env"               = "dev"
  "project"           = "portefaix"
  "service"           = "kubernetes"
  "made-by"           = "terraform"
  "portefaix-version" = "v0.25.0"
}

#############################################################################
# Network profile

network_plugin = "azure"
network_policy = "calico"

# net_profile_pod_cidr           = "10.0.16.0/20"
net_profile_service_cidr       = "10.0.32.0/20"
net_profile_dns_service_ip     = "10.0.32.10"
net_profile_docker_bridge_cidr = "172.0.0.1/8"

#############################################################################
# Addon profile

enable_http_application_routing = false
enable_kube_dashboard           = false
enable_azure_policy             = false
# aci_connector_linux             = false

#############################################################################
# Maintenance Window

enable_maintenance_window = true
maintenance_allowed = [
  {
    day   = "Monday",
    hours = [1, 2, 3, 4, 5, 6, 20, 21, 22, 23]
  },
  {
    day   = "Tuesday",
    hours = [1, 2, 3, 4, 5, 6, 20, 21, 22, 23]
  },
  {
    day   = "Wednesday",
    hours = [1, 2, 3, 4, 5, 6, 20, 21, 22, 23]
  },
  {
    day   = "Thursday",
    hours = [1, 2, 3, 4, 5, 6, 20, 21, 22, 23]
  },
  {
    day   = "Friday",
    hours = [1, 2, 3, 4, 5, 6, 20, 21, 22, 23]
  },
]
maintenance_not_allowed = [
  {
    start = "2021-12-31T01:00:00Z",
    end   = "2021-12-31T23:00:00Z"
  },
  {
    start = "2022-12-31T01:00:00Z",
    end   = "2022-12-31T23:00:00Z"
  }
]

#############################################################################
# Node pools

agents_pool_name          = "core"
agents_count              = 2
agents_size               = "Standard_D2s_v3"
os_disk_size_gb           = 50
enable_auto_scaling       = true
agents_min_count          = 1
agents_max_count          = 4
agents_availability_zones = [1, 2, 3]
agents_type               = "VirtualMachineScaleSets"
agents_max_pods           = 110

agents_labels = {
  "project"  = "portefaix"
  "env"      = "dev"
  "service"  = "kubernetes"
  "nodepool" = "core"
  "made-by"  = "terraform"
}

agents_tags = {
  "env"      = "dev"
  "project"  = "portefaix"
  "service"  = "kubernetes"
  "nodepool" = "core"
  "made-by"  = "terraform"
}

node_pools = [
  {
    name                = "ops"
    vm_size             = "Standard_D2s_v3"
    os_disk_size_gb     = 50
    os_disk_type        = "Managed"
    priority            = "Spot"
    enable_auto_scaling = true
    count               = 0
    min_count           = 0
    max_count           = 4
    max_pods            = 110
    labels = {
      "project"  = "portefaix"
      "env"      = "dev"
      "service"  = "kubernetes"
      "nodepool" = "ops"
      "made-by"  = "terraform"
    },
    taints = [
      "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
    ],
    tags = {
      "env"      = "dev"
      "project"  = "portefaix"
      "service"  = "kubernetes"
      "nodepool" = "ops"
      "made-by"  = "terraform"
    }
  }
]
