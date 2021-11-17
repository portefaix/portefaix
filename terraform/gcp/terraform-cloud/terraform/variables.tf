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

variable "project" {
  type        = string
  description = "The project in which the resource belongs"
}

variable "region" {
  type        = string
  description = "The location linked to the project"
}

#############################################################################
# Terraform Cloud

variable "organization" {
  type        = string
  description = "Name of the Terraform Cloud organization"
}

variable "workspaces" {
  type = map(object({
    directory = string
    branch    = string,
    tags      = list(string)
    trigger   = list(string)
  }))
  description = "Terraform cloud workspaces"
}

variable "gh_organization" {
  type        = string
  description = "Organization name in your VCS provider"
}

variable "gh_repo" {
  type        = string
  description = "Repository name in your VCS provider"
}

variable "github_oauth_token" {
  type        = string
  description = "Github token for Terraform Cloud"
}

variable "credentials" {
  type        = string
  description = "GCP json credentials"
}
