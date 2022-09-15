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

#############################################################################
# Project

org_name = "portefaix"

logging_account_id = "763212660804"

##############################################################################
# Cloudtrail

cloudtrail_name = "portefaix"
bucket_name     = "portefaix-cloudtrail"

#############################################################################
# Kinesis

stream_name = "portefaix-cloudtrail"

#############################################################################
# SNS

sns_topic_name = "portefaix-cloudtrail"

#############################################################################
# Commons

tags = {
  "Env"     = "Security"
  "Service" = "Cloudtrail"
}
