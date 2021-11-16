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

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "default_tags" {
  type        = map(string)
  description = "Tags for the AWS provider"
  default = {
    "Project" = "portefaix"
    "Made-By" = "terraform"
  }
}

#############################################################################
# Networking

variable "vpc_name" {
  type        = string
  description = "ID of the VPC"
}

#############################################################################
# Kubernetes cluster


variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "The EKS Kubernetes version"
}

variable "tags" {
  description = "A map of tags to add to all resources. Tags added to launch configuration or templates override these values for ASG Tags only."
  type        = map(string)
  default = {
    "made-by" = "terraform"
  }
}

variable "cluster_tags" {
  description = "A map of tags to add to just the eks resource."
  type        = map(string)
  default = {
    "made-by" = "terraform"
  }
}

variable "node_groups_defaults" {
  description = "Map of values to be applied to all node groups. See `node_groups` module's documentation for more details"
  type        = any
}

variable "node_groups" {
  description = "Map of map of node groups to create. See `node_groups` module's documentation for more details"
  type        = any
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

# variable "map_users" {
#   description = "Additional IAM users to add to the aws-auth configmap."
#   type = list(object({
#     userarn  = string
#     username = string
#     groups   = list(string)
#   }))
#   default = []
# }

#############################################################################
# Addons
variable "addon_vpc_cni_version" {
  type        = string
  description = "Version of the VPC CNI to install"
}

variable "addon_coredns_version" {
  type        = string
  description = "Version of CoreDNS to install"
}

variable "addon_kube_proxy_version" {
  type        = string
  description = "Version of kube proxy to install"
}

#############################################################################
# Monitoring

variable "enabled_logs" {
  type        = list(any)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  description = "A list of the desired control plane logging to enable"
}

variable "log_retention" {
  type        = number
  default     = 7
  description = "Days of log retention in cloudwatch"
}


#############################################################################
# EBS CSI Driver

# variable "ebs_csi_controller_role_name" {
#   description = "The name of the EBS CSI driver IAM role"
#   type        = string
#   default     = "ebs-csi-driver-controller"
# }

# variable "ebs_csi_controller_role_policy_name" {
#   description = "The prefix of the EBS CSI driver IAM policy"
#   default     = "AmazonEKS_EBS_CSI_Driver_Policy"
#   type        = string
# }

variable "ebs_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "ebs_csi_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "ebs-csi-controller"
}

variable "ebs_csi_controller_namespace" {
  description = "The K8s namespace for all EBS CSI driver resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# EFS CSI Driver

# variable "efs_csi_controller_role_name" {
#   description = "The name of the EFS CSI driver IAM role"
#   type        = string
#   default     = "efs-csi-driver-controller"
# }

# variable "efs_csi_controller_role_policy_name" {
#   description = "The prefix of the EFS CSI driver IAM policy"
#   default     = "AmazonEKS_EFS_CSI_Driver_Policy"
#   type        = string
# }

variable "efs_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "efs_csi_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "efs-csi-controller"
}

variable "efs_csi_controller_namespace" {
  description = "The K8s namespace for all EFS CSI driver resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# FSX CSI Driver

# variable "fsx_csi_controller_role_name" {
#   description = "The name of the FSX CSI driver IAM role"
#   type        = string
#   default     = "fsx-csi-driver-controller"
# }

# variable "fsx_csi_controller_role_policy_name" {
#   description = "The prefix of the FSX CSI driver IAM policy"
#   default     = "AmazonEKS_FSX_CSI_Driver_Policy"
#   type        = string
# }

variable "fsx_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "fsx_csi_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "fsx-csi-controller"
}

variable "fsx_csi_controller_namespace" {
  description = "The K8s namespace for all FSX CSI driver resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# Secret Store CSI Driver

#tfsec:ignore:GEN001
# variable "secret_store_csi_controller_role_name" {
#   description = "The name of the Secret Store CSI driver IAM role"
#   type        = string
#   default     = "secret-store-csi-driver"
# }

# #tfsec:ignore:GEN001
# variable "secret_store_csi_controller_role_policy_name" {
#   description = "The prefix of the Secret Store CSI driver IAM policy"
#   default     = "AmazonEKS_SecretStore_CSI_Driver_Policy"
#   type        = string
# }

variable "secret_store_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "secrets_data" {
  description = "Secret Store CSI Driver data"
  type = list(object({
    name      = string
    prefix    = string
    namespace = string
    sa_name   = string
  }))
  default = []
}


#############################################################################
# AWS ALB Controller

# variable "alb_controller_role_name" {
#   description = "The name of the EBS CSI driver IAM role"
#   type        = string
#   default     = "aws-load-balancer-controller"
# }

# variable "alb_controller_role_policy_name" {
#   description = "The prefix of the EBS CSI driver IAM policy"
#   default     = "AWSLoadBalancerControllerIAMPolicy"
#   type        = string
# }

variable "alb_controller_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "alb_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "alb_controller_namespace" {
  description = "The K8s namespace for ALB Controller resources"
  type        = string
  default     = "kube-system"
}
