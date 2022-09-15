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

data "aws_iam_policy_document" "cloudtrail" {
  statement {
    effect    = "Allow"
    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.cloudtrail.arn]

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    condition {
      variable = "aws:SourceArn"
      test     = "ArnLike"
      values   = ["arn:aws:s3:*:*:${data.aws_s3_bucket.cloudtrail_logs.id}"]
    }

    # condition {
    #   variable = "aws:SourceAccount"
    #   test     = "StringEquals"
    #   values   = [local.account-id]
    # }
  }
}

#tfsec:ignore:aws-sns-enable-topic-encryption
resource "aws_sns_topic" "cloudtrail" {
  provider = aws.logging

  name   = var.sns_topic_name
  policy = data.aws_iam_policy_document.cloudtrail.json

  tags = merge({
    "Name" = var.sns_topic_name
  }, var.tags)
}
