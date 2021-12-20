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

resource "aws_iam_policy" "adot" {
  name        = var.adot_collector_role_policy_name
  description = format("AWS Distro for Telemetry")
  path        = "/"
  #tfsec:ignore:AWS099
  policy = file("${path.module}/adot_policy.json")
  tags = merge(
    var.cluster_tags,
    var.adot_tags,
    var.tags
  )
}

module "adot" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"

  create_role                   = true
  role_description              = "ADOT Role"
  role_name                     = var.adot_collector_name
  provider_url                  = module.eks.cluster_oidc_issuer_url
  role_policy_arns              = [aws_iam_policy.adot.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.adot_namespace}:${var.adot_sa_name}"]
  tags = merge(
    var.cluster_tags,
    var.adot_tags,
    var.tags
  )
}
