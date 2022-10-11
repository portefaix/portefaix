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

region = "eu-west-1"

#############################################################################
# ROOT

org_name = "portefaix"

admin_group_name = "PortefaixAdministrators"

#############################################################################
# Budgets

# budget_services = {
#   EC2 = {
#     budget_limit = 10
#   }
#   ECR = {
#     budget_limit = 10
#   }
#   Kubernetes = {
#     budget_limit = 10
#   }
# }

#############################################################################
# AWS Config

slack_channel  = "notifications"
slack_username = "portefaix-aws-staging"

#############################################################################
# SNS

sns_security_alerts = "security-alerts"

#############################################################################
# Cloudtrail

cloudtrail_logging = false

#############################################################################
# Commons

tags = {
  "Env" = "Root"
}
