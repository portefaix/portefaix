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

##############################################################################
# Terraform Cloud

organization = "portefaix"

workspaces = {
  portefaix-aws-staging-vpc = {
    directory      = "terraform/aws/vpc/staging"
    tags           = ["aws", "vpc"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/vpc/*.tf",
    ]
  },
  portefaix-aws-staging-eip-igw = {
    directory      = "terraform/aws/elastic-ips/internet-gateway/staging"
    tags           = ["aws", "elasticip", "internetgateway"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/internet-gateway/*.tf",
    ]
  },
  portefaix-aws-staging-alb = {
    directory      = "terraform/aws/alb/staging"
    tags           = ["aws", "alb"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/alb/*.tf",
    ]
  },
  portefaix-aws-staging-eks = {
    directory      = "terraform/aws/eks/staging"
    tags           = ["aws", "eks"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/eks/*.tf",
    ]
  },
  portefaix-aws-staging-ecr = {
    directory      = "terraform/aws/ecr/staging"
    tags           = ["aws", "ecr"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/ecr/*.tf",
    ]
  },
  portefaix-aws-staging-observability = {
    directory      = "terraform/aws/observability/staging"
    tags           = ["aws", "stack", "observability"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/observability/*.tf",
    ]
  },
  portefaix-aws-staging-notifications = {
    directory      = "terraform/aws/notifications/staging"
    tags           = ["aws", "stack", "notifications"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/notifications/*.tf",
    ]
  },
  portefaix-aws-staging-cert-manager = {
    directory      = "terraform/aws/cert-manager/staging"
    tags           = ["aws", "stack", "observability"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/cert-manager/*.tf",
    ]
  },
  portefaix-aws-staging-external-dns = {
    directory      = "terraform/aws/external-dns/staging"
    tags           = ["aws", "stack", "externaldns"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/external-dns/*.tf",
    ]
  },
  portefaix-aws-staging-velero = {
    directory      = "terraform/aws/velero/staging"
    tags           = ["aws", "stack", "velero"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/velero/*.tf",
    ]
  },
  portefaix-aws-staging-vector = {
    directory      = "terraform/aws/vector/staging"
    tags           = ["aws", "stack", "vector"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/vector/*.tf",
    ]
  },
  portefaix-aws-staging-bastion = {
    directory      = "terraform/aws/bastion/staging"
    tags           = ["aws", "bastion"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/bastion/*.tf",
    ]
  },
  portefaix-aws-staging-teleport = {
    directory      = "terraform/aws/teleport/staging"
    tags           = ["aws", "stack", "teleport"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/teleport/*.tf",
    ]
  },
  portefaix-aws-staging-security-hub = {
    directory      = "terraform/aws/security-hub/staging"
    tags           = ["aws", "security", "securityhub"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/security-hub/*.tf",
    ]
  },
  portefaix-aws-staging-access-analyzer = {
    directory      = "terraform/aws/access-analyzer/staging"
    tags           = ["aws", "security", "access-analyzer"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/access-analyzer/*.tf",
    ]
  },
  portefaix-aws-staging-chatbot = {
    directory      = "terraform/aws/chatbot/staging"
    tags           = ["aws", "events", "chatbot"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/chatbot/*.tf",
    ]
  },
  portefaix-aws-staging-guardduty = {
    directory      = "terraform/aws/guardduty/staging"
    tags           = ["aws", "security", "guardduty"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/guardduty/*.tf",
    ]
  },
  portefaix-aws-staging-waf = {
    directory      = "terraform/aws/waf/staging"
    tags           = ["aws", "security", "waf"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/waf/*.tf",
    ]
  },
  portefaix-aws-staging-secrets = {
    directory      = "terraform/aws/secrets/staging"
    tags           = ["aws", "security", "secrets"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/secrets/*.tf",
    ]
  },
}

gh_organization = "portefaix"
gh_repo         = "portefaix"
