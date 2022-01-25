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
# Security Hub

variable "enable_aws_foundational" {
  type        = bool
  description = "Enable AWS Foundational Security Best Practices"
}

variable "enable_cis" {
  type        = bool
  description = "Enable CIS AWS Foundations"
}

variable "enable_pci_dss" {
  type        = bool
  description = "Enable Payment Card Industry Data Security Standard (PCI DSS"
}

variable "tags" {
  type        = map(string)
  description = "Tags for AWS resources"
  default = {
    "Made-By" = "terraform"
  }
}

variable "sns_create_topic" {
  description = "Whether to create the SNS topic"
  type        = bool
  default     = true
}

variable "sns_topic_name" {
  description = "The name of the SNS topic to create"
  type        = string
}
