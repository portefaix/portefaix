# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
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
# Crossplane











variable "role_name" {
  description = "The name of the Crossplane IAM role"
  type        = string
  default     = "crossplane"
}

variable "role_policy_name" {
  description = "The prefix of the Crossplane IAM policy"
  type        = string
  default     = "CrossplaneIAMPolicy"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "namespace" {
  type        = string
  description = "The Kubernetes namespace"
  default     = "crossplane-system"
}

variable "service_account" {
  type        = string
  description = "The Kubernetes service account"
  default     = "provider-aws"
}

variable "tags" {
  type        = map(string)
  description = "Tags for AWS resources"
  default = {
    "made-by" = "terraform"
  }
}
