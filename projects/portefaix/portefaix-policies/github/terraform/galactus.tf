# Copyright (C) 2018-2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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
  name        = "portefaix-policies"
  description = "Portefaix policies"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  has_projects       = true
  allow_merge_commit = true

  topics = [
    "portefaix",
    "opa",
    "rego",
    "galactus"
  ]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "0.4.0"

  repository_name = github_repository.project.name
}

resource "github_issue_label" "area_opa" {
  repository  = github_repository.project.name
  name        = "area/opa"
  description = "Open Policy Agent"
  color       = "cc317c"
}

resource "github_issue_label" "area_kyverno" {
  repository  = github_repository.project.name
  name        = "area/kyverno"
  description = "Kyverno"
  color       = "cc317c"
}

resource "github_issue_label" "area_kubewarden" {
  repository  = github_repository.project.name
  name        = "area/kubewarden"
  description = "Kubewarden"
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
  description = "Github"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_github" {
  repository  = github_repository.project.name
  name        = "dependency/github"
  description = "Dependency Github Action"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_kyverno" {
  repository  = github_repository.project.name
  name        = "dependency/kyverno"
  description = "Dependency Kyverno"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_opa" {
  repository  = github_repository.project.name
  name        = "dependency/opa"
  description = "Dependency Open Policy Agent"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_kubewarden" {
  repository  = github_repository.project.name
  name        = "dependency/kubewarden"
  description = "Dependency Kubewarden"
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
