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

module "irsa_fsx_csi_driver" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.3.0"

  role_name = var.fsx_csi_controller_role_name
  attach_fsx_csi_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.cluster_oidc_issuer_url
      namespace_service_accounts = [
        "${var.fsx_csi_controller_namespace}:${var.fsx_csi_controller_sa_name}",
      ]
    }
  }

  tags = merge(
    var.cluster_tags,
    var.fsx_csi_driver_tags,
    var.tags
  )
}
