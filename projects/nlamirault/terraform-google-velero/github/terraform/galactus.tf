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
  name        = "terraform-google-velero"
  description = "Terraform module for Velero"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  has_projects       = true
  allow_merge_commit = true

  topics = [
    "terraform",
    "terraform-module",
    "google",
    "velero",
    "galactus"
  ]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "0.3.0"

  repository_name = github_repository.project.name
}

resource "github_issue_label" "area_terraform" {
  repository  = github_repository.project.name
  name        = "area/terraform"
  description = "Terraform"
  color       = "cc317c"
}

resource "github_issue_label" "area_renovate" {
  repository  = github_repository.project.name
  name        = "area/renovate"
  description = "Renovate"
  color       = "cc317c"
}

resource "github_issue_label" "area_github" {
  repository  = github_repository.project.name
  name        = "area/github"
  description = "Github Action"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_terraform" {
  repository  = github_repository.project.name
  name        = "dependency/terraform"
  description = "Dependency Terraform"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_github" {
  repository  = github_repository.project.name
  name        = "dependency/github"
  description = "Dependency Github Actions"
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
