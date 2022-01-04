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
DIR = $(shell pwd)

include $(MKFILE_DIR)/commons.mk
include $(MKFILE_DIR)/k3s.*.mk

PYTHON = python3

# ANSIBLE_VERSION = 4.5.0
# MOLECULE_VERSION = 3.3.0
ANSIBLE_VENV = $(DIR)/.venv
ANSIBLE_ROLES = $(DIR)/roles

MNT_DEVICE = $(MNT_DEVICE_$(ENV))
MNT_ROOT   = $(MNT_ROOT_$(ENV))
MNT_BOOT   = $(MNT_BOOT_$(ENV))

K3S_VERSION = $(K3S_VERSION_$(ENV))
K3S_USER = $(K3S_USER_$(ENV))


# ====================================
# S D C A R D
# ====================================

##@ SDCard

.PHONY: sdcard-format
sdcard-format: guard-ENV guard-IMG sdcard-unmount ## Format the SD card with Raspbian
	@echo -e "$(OK_COLOR)[$(APP)] Formatting SD card with $(IMG) ${SERVICE}$(NO_COLOR)"
	sudo dd bs=4M if=./$(IMG) of=$(MNT_DEVICE) status=progress conv=fsync

.PHONY: sdcard-mount
sdcard-mount: guard-ENV ## Mount the current SD device
	sudo mkdir -p $(MNT_BOOT)
	sudo mkdir -p $(MNT_ROOT)
	sudo mount $(MNT_DEVICE)p1 $(MNT_BOOT)
	sudo mount $(MNT_DEVICE)p2 $(MNT_ROOT)

.PHONY: sdcard-unmount
sdcard-unmount: guard-ENV ## Unmount the current SD device
	sudo umount $(MNT_DEVICE)p1 || true
	sudo umount $(MNT_DEVICE)p2 || true

# ====================================
# K 3 S
# ====================================

##@ K3s

.PHONY: k3s-create
k3s-create: guard-SERVER_IP guard-USER guard-ENV ## Setup a k3s cluster
	@echo -e "$(OK_COLOR)[$(APP)] Install K3S$(NO_COLOR)"
	@k3sup install --ip $(SERVER_IP) --user $(K3S_USER) \
		--k3s-version $(K3S_VERSION) \
		--merge --k3s-extra-args '--no-deploy traefik' \
  		--local-path $${HOME}/.kube/config \
  		--context k3s-portefaix-homelab

.PHONY: k3s-join
k3s-join: guard-SERVER_IP guard-USER guard-AGENT_IP guard-ENV ## Add a node to the k3s cluster
	@echo -e "$(OK_COLOR)[$(APP)] Add a K3S node$(NO_COLOR)"
	@k3sup join --ip $(AGENT_IP) --server-ip $(SERVER_IP) --user $(K3S_USER) \
		--k3s-version $(K3S_VERSION)

# --k3s-extra-args '--node-label node-role.kubernetes.io/worker=true --node-taint key=value:NoExecute' \

.PHONY: k3s-kube-credentials
k3s-kube-credentials: guard-ENV ## Credentials for k3s (ENV=xxx)
	@kubectl config use-context $(KUBE_CONTEXT)


# ====================================
# A N S I B L E
# ====================================

##@ Ansible

.PHONY: ansible-init
ansible-init: ## Install requirements
	@echo -e "$(OK_COLOR)[$(APP)] Install requirements$(NO_COLOR)"
	@poetry install --no-root

# @test -d $(ANSIBLE_VENV) || $(PYTHON) -m venv $(ANSIBLE_VENV)
# @. $(ANSIBLE_VENV)/bin/activate \
# 	&& pip3 install ansible==$(ANSIBLE_VERSION) molecule docker

.PHONY: ansible-deps
ansible-deps: guard-SERVICE ## Install dependencies (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Install dependencies$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible-galaxy collection install -r $(SERVICE)/roles/requirements.yml -p $(ANSIBLE_ROLES) --force \
		&& ansible-galaxy install -r $(SERVICE)/roles/requirements.yml -p $(ANSIBLE_ROLES) --force

.PHONY: ansible-ping
ansible-ping: guard-SERVICE guard-ENV ## Check Ansible installation (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Check Ansible$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible -c local -m ping all -i $(SERVICE)/inventories/$(ENV).ini

.PHONY: ansible-debug
ansible-debug: guard-SERVICE guard-ENV ## Retrieve informations from hosts (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Check Ansible$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible -m setup all -i $(SERVICE)/inventories/$(ENV).ini

.PHONY: ansible-run
ansible-run: guard-SERVICE guard-ENV ## Execute Ansible playbook (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Execute Ansible playbook$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible-playbook ${DEBUG} -i $(SERVICE)/inventories/$(ENV).ini $(SERVICE)/main.yml

.PHONY: ansible-dryrun
ansible-dryrun: guard-SERVICE guard-ENV ## Execute Ansible playbook (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Execute Ansible playbook$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible-playbook ${DEBUG} -i $(SERVICE)/inventories/$(ENV).ini $(SERVICE)/main.yml --check
