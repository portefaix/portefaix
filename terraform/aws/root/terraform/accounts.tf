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

resource "aws_organizations_account" "shared" {
  name              = local.shared_account
  email             = "${var.org_email}+${var.org_name}.${local.shared_account}@gmail.com"
  parent_id         = aws_organizations_organizational_unit.shared.id
  
  iam_user_access_to_billing = "ALLOW"

  tags = merge({
    "Name" = local.shared_account
  }, var.tags)

  # depends_on = [
  #   aws_organizations_organizational_unit.shared
  # ]
}

resource "aws_organizations_account" "logging" {
  name              = local.logging_account
  email             = "${var.org_email}+${var.org_name}.${local.logging_account}@gmail.com"
  parent_id         = aws_organizations_organizational_unit.shared.id

  tags = merge({
    "Name" = local.logging_account
  }, var.tags)

  depends_on = [
    aws_organizations_organizational_unit.shared
  ]
}

resource "aws_organizations_account" "security" {
  name              = local.security_account
  email             = "${var.org_email}+${var.org_name}.${local.security_account}@gmail.com"
  parent_id         = aws_organizations_organizational_unit.security.id

  tags = merge({
    "Name" = local.security_account
  }, var.tags)

  # depends_on = [
  #   aws_organizations_organizational_unit.security
  # ]
}

resource "aws_organizations_account" "audit" {
  name              = local.audit_account
  email             = "${var.org_email}+${var.org_name}.${local.audit_account}@gmail.com"
  parent_id         = aws_organizations_organizational_unit.security.id

  tags = merge({
    "Name" = local.audit_account
  }, var.tags)

  # depends_on = [
  #   aws_organizations_organizational_unit.security
  # ]
}

resource "aws_organizations_account" "network" {
  name              = local.network_account
  email             = "${var.org_email}+${var.org_name}.${local.network_account}@gmail.com"
  parent_id         = aws_organizations_organizational_unit.shared.id

  tags = merge({
    "Name" = local.network_account
  }, var.tags)

  # depends_on = [
  #   aws_organizations_organizational_unit.shared
  # ]
}


resource "aws_organizations_account" "core_prod" {
  name              = local.core_prod_account
  email             = "${var.org_email}+${var.org_name}.${local.core_prod_account}@gmail.com"
  parent_id         = aws_organizations_organizational_unit.core.id

  tags = merge({
    "Name" = local.core_prod_account
  }, var.tags)

  # depends_on = [
  #   aws_organizations_organizational_unit.core
  # ]
}

resource "aws_organizations_account" "core_dev" {
  name              = local.core_dev_account
  email             = "${var.org_email}+${var.org_name}.${local.core_dev_account}@gmail.com"
  parent_id         = aws_organizations_organizational_unit.core.id

  tags = merge({
    "Name" = local.core_dev_account
  }, var.tags)

  # depends_on = [
  #   aws_organizations_organizational_unit.core
  # ]
}