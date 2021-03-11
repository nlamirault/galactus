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
  name        = "portefaix"
  description = "Kubernetes lab"

  has_issues             = true
  has_wiki               = true
  has_downloads          = true
  has_projects           = true
  allow_merge_commit     = true
  delete_branch_on_merge = true

  pages {
    source {
      branch = "gh-pages" 
      path   = "/"
    }
  }

  topics = ["terraform", "kubernetes", "gitops", "gitops-toolkit", "kustomize", "helm", "galactus"]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "0.2.0"
  
  repository_name = github_repository.project.name
}

resource "github_issue_label" "area_gcp" {
  repository  = github_repository.project.name
  name        = "area/gcp"
  description = "Cloud PRovider / Google Cloud Provider"
  color       = "cc317c"
}

resource "github_issue_label" "area_aws" {
  repository  = github_repository.project.name
  name        = "area/aws"
  description = "Cloud PRovider / Amazon AWS"
  color       = "cc317c"
}

resource "github_issue_label" "area_azure" {
  repository  = github_repository.project.name
  name        = "area/azure"
  description = "Cloud PRovider / Microsoft Azure"
  color       = "cc317c"
}

resource "github_issue_label" "area_scaleway" {
  repository  = github_repository.project.name
  name        = "area/scaleway"
  description = "Cloud PRovider / Scaleway"
  color       = "cc317c"
}

resource "github_issue_label" "area_digitalocean" {
  repository  = github_repository.project.name
  name        = "area/digitalocean"
  description = "Cloud PRovider / Digital Ocean"
  color       = "cc317c"
}

resource "github_issue_label" "area_alicloud" {
  repository  = github_repository.project.name
  name        = "area/alicloud"
  description = "Cloud PRovider / Alicloud"
  color       = "cc317c"
}

resource "github_issue_label" "area_kubernetes" {
  repository  = github_repository.project.name
  name        = "area/kubernetes"
  description = "Kubernetes"
  color       = "cc317c"
}

resource "github_issue_label" "area_terraform" {
  repository  = github_repository.project.name
  name        = "area/terraform"
  description = "Terraform"
  color       = "cc317c"
}

resource "github_issue_label" "area_inspec" {
  repository  = github_repository.project.name
  name        = "area/inspec"
  description = "Inspec"
  color       = "cc317c"
}

resource "github_issue_label" "area_renovate" {
  repository  = github_repository.project.name
  name        = "area/renovate"
  description = "Renovate"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_terraform" {
  repository  = github_repository.project.name
  name        = "dependency/terraform"
  description = "Dependency Terraform"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_docker" {
  repository  = github_repository.project.name
  name        = "dependency/docker"
  description = "Dependency Docker"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_helm" {
  repository  = github_repository.project.name
  name        = "dependency/helm"
  description = "Dependency Helm"
  color       = "6fcb70"
}

resource "github_issue_label" "size_xs" {
  repository  = github_repository.project.name
  name        = "size/xs"
  description = "Size XS"
  color       = "ededed"
}

resource "github_issue_label" "size_s" {
  repository  = github_repository.project.name
  name        = "size/s"
  description = "Size S"
  color       = "ededed"
}

resource "github_issue_label" "size_m" {
  repository  = github_repository.project.name
  name        = "size/m"
  description = "Size M"
  color       = "ededed"
}

resource "github_issue_label" "size_l" {
  repository  = github_repository.project.name
  name        = "size/l"
  description = "Size L"
  color       = "ededed"
}

resource "github_issue_label" "size_xl" {
  repository  = github_repository.project.name
  name        = "size/xl"
  description = "Size XL"
  color       = "ededed"
}