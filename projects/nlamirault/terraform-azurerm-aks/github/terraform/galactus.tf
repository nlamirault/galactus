# Copyright (C) 2018-2019 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

# Galactus repository
# -------------------------------------------------------------------

resource "github_repository" "project" {
  name        = "terraform-azurerm-aks"
  description = "Terraform module for Microsft AKS"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  has_projects       = true
  allow_merge_commit = true

  topics = [
    "terraform",
    "terraform-module",
    "aks",
    "galactus"
  ]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "0.0.2"

  repository_name = github_repository.project.name
}
