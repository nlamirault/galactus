# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

APP = G A L A C T U S

# GCP_PROJECT_preprod =
# GCP_PROJECT_prod =
# GCP_PROJECT = $(GCP_PROJECT_$(ENV))
GCP_PROJECT = galactus
GCP_CURRENT_PROJECT = $(shell gcloud info --format='value(config.project)')

SHELL = /bin/bash -o pipefail

DIR = $(shell pwd)

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
INFO_COLOR=\033[36m
WHITE_COLOR=\033[1m

MAKE_COLOR=\033[33;01m%-20s\033[0m

.DEFAULT_GOAL := help

OK=[✅]
KO=[❌]
WARN=[⚠️]

.PHONY: help
help:
	@echo -e "$(OK_COLOR)                      $(APP)$(NO_COLOR)"
	@echo "------------------------------------------------------------------"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make ${INFO_COLOR}<target>${NO_COLOR}\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  ${INFO_COLOR}%-25s${NO_COLOR} %s\n", $$1, $$2 } /^##@/ { printf "\n${WHITE_COLOR}%s${NO_COLOR}\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo ""

# .PHONY: help
# help:
# 	@echo -e "$(OK_COLOR)==== $(APP) ====$(NO_COLOR)"
# 	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(MAKE_COLOR) : %s\n", $$1, $$2}'

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo -e "$(ERROR_COLOR)Environment variable $* not set$(NO_COLOR)"; \
		exit 1; \
	fi

check-%:
	@if $$(hash $* 2> /dev/null); then \
		echo -e "$(OK_COLOR)$(OK)$(NO_COLOR) $*"; \
	else \
		echo -e "$(ERROR_COLOR)$(KO)$(NO_COLOR) $*"; \
	fi

##@ Development

.PHONY: check
check: check-terraform check-gcloud guard-ENV ## Check requirements
	@if [[ "${GCP_PROJECT}" != "${GCP_CURRENT_PROJECT}" ]] ; then \
		echo -e "$(ERROR_COLOR)$(KO)$(NO_COLOR) ${GCP_CURRENT_PROJECT}"; \
	else \
		echo -e "$(OK_COLOR)$(OK)$(NO_COLOR) ${GCP_CURRENT_PROJECT}"; \
	fi


# ====================================
# G C L O U D
# ====================================

##@ GCloud

# .SILENT:
.PHONY: gcloud-project-current
gcloud-project-current: ## Display current GCP project
	@gcloud info --format='value(config.project)'

.PHONY: gcp-project-switch
gcp-project-switch: guard-ENV ## Switch GCP project
	gcloud config set project ${GCP_PROJECT}

.PHONY: gcloud-check-project
gcloud-check-project: guard-ENV
	@if [[ "${GCP_PROJECT}" != "${GCP_CURRENT_PROJECT}" ]] ; then \
		echo -e "$(ERROR_COLOR)[KO]$(NO_COLOR) GCP project: ${GCP_PROJECT} vs ${GCP_CURRENT_PROJECT}"; \
		exit 1; \
	fi

.PHONY: gcloud-project-switch
gcloud-project-switch: guard-ENV ## Switch GCP project (ENV=xxx)
	@gcloud config set project ${GCP_PROJECT}

.PHONY: gcloud-secret-create
gcloud-secret-create: guard-ENV guard-SERVICE guard-SECRET guard-DATA ## Create a secret
	@echo -e "$(OK_COLOR)[$(APP)] Create a secret for: $(SERVICE)$(NO_COLOR)"
	echo -n $(DATA) |  gcloud beta secrets create galactus_$(SERVICE)_$(ENV)_$(SECRET) \
		--project $(GCP_PROJECT) \
    	--replication-policy="automatic" --data-file=-

.PHONY: gcloud-secret-create-from-file
gcloud-secret-create-from-file: guard-ENV guard-CUSTOMER guard-SERVICE guard-SECRET guard-FILE ## Create a secret
	@echo -e "$(OK_COLOR)[$(APP)] Create a secret for: $(SERVICE)$(NO_COLOR)"
	gcloud beta secrets create galactus_$(SERVICE)_$(ENV)_$(SECRET) \
		--project $(GCP_PROJECT) \
    	--replication-policy="automatic" --data-file=$(FILE)

# ====================================
# T E R R A F O R M
# ====================================

##@ Terraform

.PHONY: terraform-init
terraform-init: guard-SERVICE guard-ENV ## Init infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Plan infrastructure$(NO_COLOR)"
ifneq ("$(wildcard $(SERVICE)/secret.sh)","")
	. $(SERVICE)/secret.sh $(GCP_PROJECT) \
    	&& cd $(SERVICE)/terraform \
		&& terraform init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars
else
	cd $(SERVICE)/terraform \
		&& terraform init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars
endif

.PHONY: terraform-plan
terraform-plan: guard-SERVICE guard-ENV ## Plan infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Plan infrastructure$(NO_COLOR)"
ifneq ("$(wildcard $(SERVICE)/secret.sh)","")
	. $(SERVICE)/secret.sh $(GCP_PROJECT) \
    	&& cd $(SERVICE)/terraform \
		&& terraform init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform plan -lock-timeout=60s -var-file=tfvars/$(ENV).tfvars
else
	cd $(SERVICE)/terraform \
		&& terraform init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform plan -lock-timeout=60s -var-file=tfvars/$(ENV).tfvars
endif

.PHONY: terraform-show
terraform-show: guard-SERVICE guard-ENV ## Show infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Show infrastructure$(NO_COLOR)"
ifneq ("$(wildcard $(SERVICE)/secret.sh)","")
	. $(SERVICE)/secret.sh $(GCP_PROJECT) \
    	&& cd $(SERVICE)/terraform \
		&& terraform init -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform show
else
	cd $(SERVICE)/terraform \
		&& terraform init -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform show
endif

.PHONY: terraform-apply
terraform-apply: guard-SERVICE guard-ENV ## Builds or changes infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Apply infrastructure$(NO_COLOR)"
ifneq ("$(wildcard $(SERVICE)/secret.sh)","")
	. $(SERVICE)/secret.sh $(GCP_PROJECT) \
    	&& cd $(SERVICE)/terraform \
		&& terraform init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform apply -lock-timeout=60s -var-file=tfvars/$(ENV).tfvars
else
	cd $(SERVICE)/terraform \
		&& terraform init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform apply -lock-timeout=60s -var-file=tfvars/$(ENV).tfvars
endif

.PHONY: terraform-destroy
terraform-destroy: guard-SERVICE guard-ENV ## Builds or changes infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Apply infrastructure$(NO_COLOR)"
ifneq ("$(wildcard $(SERVICE)/secret.sh)","")
	. $(SERVICE)/secret.sh $(GCP_PROJECT) \
    	&& cd $(SERVICE)/terraform \
		&& terraform init -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform destroy -lock-timeout=60s -var-file=tfvars/$(ENV).tfvars
else
	cd $(SERVICE)/terraform \
		&& terraform init -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& terraform destroy -lock-timeout=60s -var-file=tfvars/$(ENV).tfvars
endif

.PHONY: terraform-tflint
terraform-tflint: guard-SERVICE guard-ENV ## Terraform lint (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Check Terraform style$(NO_COLOR)"
ifneq ("$(wildcard $(SERVICE)/secret.sh)","")
	. $(SERVICE)/secret.sh $(GCP_PROJECT) \
    	&& tflint -c .tflint.hcl $(SERVICE)/terraform 
else
	tflint -c .tflint.hcl $(SERVICE)/terraform
endif
