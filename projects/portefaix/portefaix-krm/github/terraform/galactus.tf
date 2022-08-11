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
  name        = "portefaix-krm"
  description = "Portefaix KRM"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  has_projects       = true
  allow_merge_commit = true

  topics = [
    "portefaix",
    "kubernetes",
    "krm",
    "crossplane",
    "gcp-config-connector",
    "aws-controllers-k8s",
    "azure-service-operator",
    "galactus"
  ]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "1.2.0"

  repository_name = github_repository.project.full_name
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

resource "github_issue_label" "area_kubernetes" {
  repository  = github_repository.project.name
  name        = "area/kubernetes"
  description = "Github"
  color       = "cc317c"
}

resource "github_issue_label" "krm_crossplane" {
  repository  = github_repository.project.name
  name        = "krm/crossplane"
  description = "Crossplane"
  color       = "cc317c"
}

resource "github_issue_label" "krm_gcp_config_connector" {
  repository  = github_repository.project.name
  name        = "krm/gcp-config-connector"
  description = "GCP Config Connector"
  color       = "cc317c"
}

resource "github_issue_label" "krm_aws_controllers_k8s" {
  repository  = github_repository.project.name
  name        = "krm/aws-controllers-k8s"
  description = "AWS Controllers for Kubernetes"
  color       = "cc317c"
}

resource "github_issue_label" "krm_azure_service_operator" {
  repository  = github_repository.project.name
  name        = "krm/azure-service-operator"
  description = "Azure Service Operator"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_crossplane" {
  repository  = github_repository.project.name
  name        = "dependency/crossplane"
  description = "Dependency Crossplane"
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
