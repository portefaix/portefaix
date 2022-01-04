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

module "sops" {
  source  = "nlamirault/sops/aws"
  version = "0.3.0"

  cluster_name = var.cluster_name

  namespace       = var.namespace
  service_account = var.service_account

  user_name = var.user_name

  deletion_window_in_days = var.deletion_window_in_days

  tags = var.tags
}
