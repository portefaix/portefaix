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

module "dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "3.1.0"

  project_id = var.project
  type       = "private"
  name       = var.zone_name
  domain     = var.domain_name

  private_visibility_config_networks = [
    data.google_compute_network.vpc.id
  ]

  # https://github.com/terraform-google-modules/terraform-google-cloud-dns/pull/16
  labels = var.labels
}
