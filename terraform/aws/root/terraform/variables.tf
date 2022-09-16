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
# Provider

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "default_tags" {
  type        = map(string)
  description = "Tags for the AWS provider"
  default = {
    "Made-By" = "terraform"
  }
}

#############################################################################
# IAM

variable "aws_service_access_principals" {
  type = list(any)
  default = [
    "cloudtrail.amazonaws.com",
    "guardduty.amazonaws.com",
    "sso.amazonaws.com",
    "access-analyzer.amazonaws.com",
    "config.amazonaws.com",
    "ram.amazonaws.com"
  ]
  description = "List of service access principals for the organization"
}

variable "enabled_policy_types" {
  type        = list(any)
  default     = ["SERVICE_CONTROL_POLICY"]
  description = "List of Organizations Policy Types to enable in the Organization Root"
}

variable "org_name" {
  type        = string
  description = "Name of the AWS Organization"
}

variable "org_email" {
  type        = string
  description = "Email of the AWS Organization"
}

variable "org_email_domain" {
  type        = string
  description = "Email domain of the AWS Organization (like gmail.com)"
}

variable "org_admin_username" {
  type        = string
  description = "Name of the AWS Organization administrator"
}

variable "admin_group_name" {
  type        = string
  description = "Administrators group name"
}

variable "admin_role_name" {
  type        = string
  description = "Administrator role name"
  default     = "Administrator"
}

#############################################################################
# Budgets

variable "budget_limit_unit" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold."
  type        = string
  default     = "USD"
}

variable "budget_time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend. Valid values: `MONTHLY`, `QUARTERLY`, `ANNUALLY`."
  type        = string
  default     = "MONTHLY"
}

# variable "budget_services" {
#   description = "AWS services and their limit of budget."
#   type = map(object({
#     budget_limit = string
#   }))
# }

#############################################################################
# Commons

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
