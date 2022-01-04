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

#####################################################################""
# Provider

project = "portefaix-dev"

region = "europe-west1"

#############################################################################
# Terraform Cloud

organization = "portefaix"

workspaces = {
  portefaix-gcp-dev-vpc = {
    directory      = "terraform/gcp/vpc/dev"
    tags           = ["gcp", "vpc"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/vpc/*.tf",
    ]
  },
  portefaix-gcp-dev-cloud-dns = {
    directory      = "terraform/gcp/cloud-dns/dev"
    tags           = ["gcp", "clouddns"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/cloud-dns/*.tf",
    ]
  },
  portefaix-gcp-dev-external-ip-cloud-nat = {
    directory      = "terraform/gcp/external-ips/cloud-nat/dev"
    tags           = ["gcp", "externalips", "cloudnat"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/cloud-nat/*.tf",
    ]
  },
  portefaix-gcp-dev-cloud-nat = {
    directory      = "terraform/gcp/cloud-nat/dev"
    tags           = ["gcp", "cloudnat"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/cloud-nat/*.tf",
    ]
  },
  portefaix-gcp-dev-bastion = {
    directory      = "terraform/gcp/bastion/dev"
    tags           = ["gcp", "bastion"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/bastion/*.tf",
    ]
  },
  portefaix-gcp-dev-pubsub = {
    directory      = "terraform/gcp/pubsub/dev"
    tags           = ["gcp", "pubsub"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/pubsub/*.tf",
    ]
  },
  portefaix-gcp-dev-gke = {
    directory      = "terraform/gcp/gke/dev"
    tags           = ["gcp", "gke"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/gke/*.tf",
    ]
  },
  portefaix-gcp-dev-observability = {
    directory      = "terraform/gcp/observability/dev"
    tags           = ["gcp", "kubernetes", "observability"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/observability/*.tf",
    ]
  },
  portefaix-gcp-dev-cert-manager = {
    directory      = "terraform/gcp/cert-manager/dev"
    tags           = ["gcp", "kubernetes", "certmanager"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/cert-manager/*.tf",
    ]
  },
  portefaix-gcp-dev-external-dns = {
    directory      = "terraform/gcp/external-dns/dev"
    tags           = ["gcp", "kubernetes", "externaldns"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/external-dns/*.tf",
    ]
  },
  portefaix-gcp-dev-vector = {
    directory      = "terraform/gcp/vector/dev"
    tags           = ["gcp", "kubernetes", "vector"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/vector/*.tf",
    ]
  },
  portefaix-gcp-dev-velero = {
    directory      = "terraform/gcp/velero/dev"
    tags           = ["gcp", "kubernetes", "velero"]
    gitops         = false
    branch         = "feat/gcp-tfcloud"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
      "../modules/velero/*.tf",
    ]
  },
}

gh_organization = "portefaix"
gh_repo         = "portefaix"
