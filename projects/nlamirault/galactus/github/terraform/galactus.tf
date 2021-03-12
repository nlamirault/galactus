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
  version = "0.2.0"

  repository_name = github_repository.project.name
}

resource "github_issue_label" "area_renovate" {
  repository  = github_repository.project.name
  name        = "area/renovate"
  description = "Renovate"
  color       = "cc317c"
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
