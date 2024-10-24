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
  name        = "galactus"
  description = "Terraform all my world"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  allow_merge_commit = true

  topics = ["terraform", "galactus"]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "1.2.0"

  repository_name = github_repository.project.full_name
}

resource "github_issue_label" "area_terraform" {
  repository  = github_repository.project.name
  name        = "area/terraform"
  description = "Terraform"
  color       = "cc317c"
}

resource "github_issue_label" "area_dns" {
  repository  = github_repository.project.name
  name        = "area/dns"
  description = "DNS"
  color       = "cc317c"
}

resource "github_issue_label" "area_logging" {
  repository  = github_repository.project.name
  name        = "area/logging"
  description = "Logging"
  color       = "cc317c"
}

resource "github_issue_label" "area_monitoring" {
  repository  = github_repository.project.name
  name        = "area/monitoring"
  description = "Monitoring"
  color       = "cc317c"
}

resource "github_issue_label" "area_projects" {
  repository  = github_repository.project.name
  name        = "area/projects"
  description = "Projects"
  color       = "cc317c"
}

resource "github_issue_label" "provider_gcp" {
  repository  = github_repository.project.name
  name        = "provider/gcp"
  description = "Cloud PRovider / Google Cloud Provider"
  color       = "b079a4"
}

resource "github_issue_label" "provider_aws" {
  repository  = github_repository.project.name
  name        = "provider/aws"
  description = "Cloud PRovider / Amazon AWS"
  color       = "b079a4"
}

resource "github_issue_label" "provider_azure" {
  repository  = github_repository.project.name
  name        = "provider/azure"
  description = "Cloud PRovider / Microsoft Azure"
  color       = "b079a4"
}

resource "github_issue_label" "provider_scaleway" {
  repository  = github_repository.project.name
  name        = "provider/scaleway"
  description = "Cloud PRovider / Scaleway"
  color       = "b079a4"
}

resource "github_issue_label" "provider_digitalocean" {
  repository  = github_repository.project.name
  name        = "provider/digitalocean"
  description = "Cloud PRovider / Digital Ocean"
  color       = "b079a4"
}

resource "github_issue_label" "provider_alicloud" {
  repository  = github_repository.project.name
  name        = "provider/alicloud"
  description = "Cloud PRovider / Alicloud"
  color       = "b079a4"
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

resource "github_issue_label" "dependency_github" {
  repository  = github_repository.project.name
  name        = "dependency/github"
  description = "Dependency Github Actions"
  color       = "6fcb70"
}
