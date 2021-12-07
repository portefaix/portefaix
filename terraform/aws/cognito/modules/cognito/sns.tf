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

data "aws_iam_policy_document" "cognito_sns_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["cognito-idp.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "cognito_sns" {
  name               = format("%s-cognito-sns", var.service_name)
  assume_role_policy = data.aws_iam_policy_document.cognito_sns_assume_role_policy.json

  tags = var.tags
}

#tfsec:ignore:AWS099
data "aws_iam_policy_document" "cognito_sns_publish_policy" {
  statement {
    actions = [
      "sns:Publish",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "cognito_sns_role_policy" {
  name   = format("%s-cognito-sns", var.service_name)
  policy = data.aws_iam_policy_document.cognito_sns_publish_policy.json
  tags   = var.tags
}

resource "aws_iam_role_policy_attachment" "cognito_sns_role_policy_attachment" {
  role       = aws_iam_role.cognito_sns.name
  policy_arn = aws_iam_policy.cognito_sns_role_policy.arn
}
