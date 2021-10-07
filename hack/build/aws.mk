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

MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))

include $(MKFILE_DIR)/commons.mk
include $(MKFILE_DIR)/aws.*.mk

AWS_PROJECT = $(AWS_PROJECT_$(ENV))

AWS_REGION = $(AWS_REGION_$(ENV))

AWS_CLUSTER = $(AWS_CLUSTER_$(ENV))

# Tags: tags/x.x.x.x
# Branch: heads/x.x.x.x
INSPEC_PORTEFAIX_AWS_VERSION = tags/v0.1.0
INSPEC_PORTEFAIX_AWS = https://github.com/portefaix/portefaix-inspec-aws/archive/refs/$(INSPEC_PORTEFAIX_AWS_VERSION).zip

# ====================================
# A W S
# ====================================

##@ AWS

.PHONY: aws-bucket-create
aws-bucket-create: guard-ENV ## Create bucket for bootstrap
	@echo -e "$(OK_COLOR)[$(APP)] Create bucket for bootstrap$(NO_COLOR)"
	@aws s3api create-bucket --bucket aws_$(ENV)-tfstates \
    	--region $(AWS_REGION) \
    	--create-bucket-configuration \
    	LocationConstraint=$(AWS_REGION)

.PHONY: aws-dynamodb-create-table
aws-dynamodb-create-table: guard-ENV ## Create DynamoDB table
	@echo -e "$(OK_COLOR)[$(APP)] Create DynamoDB table$(NO_COLOR)"
	@aws dynamodb create-table \
		--region $(AWS_REGION) \
		--table-name aws_$(ENV)-tfstate-lock \
		--attribute-definitions AttributeName=LockID,AttributeType=S \
		--key-schema AttributeName=LockID,KeyType=HASH \
		--provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1

.PHONY: aws-kube-credentials
aws-kube-credentials: guard-ENV ## Generate credentials
	@aws eks update-kubeconfig --name $(AWS_CLUSTER) --region $(AWS_REGION)

.PHONY: aws-assume-role
aws-assume-role: guard-ENV ## Assume role


# ====================================
# S O P S
# ====================================

# ##@ Sops

# .PHONY: aws-sops-encrypt
# aws-sops-encrypt: guard-ENV guard-CLOUD guard-FILE ## Encrypt (CLOUD=xxx ENV=xxx FILE=xxx)
# 	aws sts assume-role --role-arn "$(SOPS_ROLE)" --role-session-name aws-portefaix-$(ENV) \
# 		&& sops --encrypt --encrypted-regex '^(data|stringData)' --in-place --$(SOPS_PROVIDER) $(SOPS_KEY) $(FILE)


# ====================================
# I N S P E C
# ====================================

##@ Inspec

.PHONY: inspec-aws-debug
inspec-aws-debug: ## Test inspec
	@echo -e "$(OK_COLOR)Test infrastructure$(NO_COLOR)"
	@bundle exec inspec detect -t aws://

.PHONY: inspec-aws-test
inspec-aws-test: guard-SERVICE guard-ENV ## Test inspec
	@echo -e "$(OK_COLOR)Test infrastructure$(NO_COLOR)"
	@bundle exec inspec exec $(SERVICE)/inspec \
		-t aws:// --input-file=$(SERVICE)/inspec/attributes/$(ENV).yml \
		--reporter cli json:aws_$(ENV)_$(SERVICE).json html:aws_$(ENV)_aws_$(SERVICE).html

.PHONY: inspec-aws-cis
inspec-aws-cis: guard-ENV ## Test inspec
	@echo -e "$(OK_COLOR)CIS AWS Foundations benchmark$(NO_COLOR)"
	@bundle exec inspec exec \
		https://github.com/mitre/aws-foundations-cis-baseline.git \
		-t aws:// --reporter cli json:aws_$(ENV)_cis.json html:aws_$(ENV)_cis.html

.PHONY: inspec-aws-portefaix
inspec-aws-portefaix: guard-ENV ## Test inspec
	@echo -e "$(OK_COLOR)Test infrastructure with Portefaix AWS profile$(NO_COLOR)"
	@bundle exec inspec exec \
		$(INSPEC_PORTEFAIX_AWS) \
		-t aws:// --input-file=inspec/aws/attributes/portefaix-$(ENV).yml \
		--reporter cli json:aws_$(ENV)_portefaix.json html:aws_$(ENV)_portefaix.html

.PHONY: inspec-aws-kubernetes
inspec-aws-kubernetes: guard-ENV ## Test inspec
	@echo -e "$(OK_COLOR)CIS Kubernetes benchmark$(NO_COLOR)"
	@bundle exec inspec exec \
		https://github.com/dev-sec/cis-kubernetes-benchmark.git \
		--reporter cli json:aws_$(ENV)_k8s.json html:aws_$(ENV)_k8s.html
