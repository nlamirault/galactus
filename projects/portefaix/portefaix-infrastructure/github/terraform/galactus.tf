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
  name        = "portefaix-infrastructure"
  description = "Portefaix Infrastructure"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  has_projects       = true
  allow_merge_commit = true
  delete_branch_on_merge = true
  vulnerability_alerts   = true

  topics = [
    "portefaix",
    "kubernetes",
    "infrastructure",
    "terraform",
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

resource "github_issue_label" "area_ansible" {
  repository  = github_repository.project.name
  name        = "area/ansible"
  description = "Ansible"
  color       = "cc317c"
}

resource "github_issue_label" "area_packer" {
  repository  = github_repository.project.name
  name        = "area/packer"
  description = "Packer"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_github" {
  repository  = github_repository.project.name
  name        = "dependency/github"
  description = "Dependency Github Actions"
  color       = "6fcb70"
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

resource "github_issue_label" "dependency_ansible" {
  repository  = github_repository.project.name
  name        = "dependency/ansible"
  description = "Dependency Ansible"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_inspec" {
  repository  = github_repository.project.name
  name        = "dependency/inspec"
  description = "Dependency Inspec"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_packer" {
  repository  = github_repository.project.name
  name        = "dependency/packer"
  description = "Dependency Packer"
  color       = "6fcb70"
}

resource "github_issue_label" "cloud_aws" {
  repository  = github_repository.project.name
  name        = "cloud/aws"
  description = "Cloud Provider / Amazon AWS"
  color       = "068082"
}

resource "github_issue_label" "cloud_gcp" {
  repository  = github_repository.project.name
  name        = "cloud/gcp"
  description = "Cloud Provider / Google Cloud Platform"
  color       = "068082"
}

resource "github_issue_label" "cloud_azure" {
  repository  = github_repository.project.name
  name        = "cloud/azure"
  description = "Cloud Provider / Microsoft Azure"
  color       = "068082"
}

resource "github_issue_label" "cloud_scaleway" {
  repository  = github_repository.project.name
  name        = "cloud/scaleway"
  description = "Cloud Provider / Scaleway"
  color       = "068082"
}

resource "github_issue_label" "cloud_digitalocean" {
  repository  = github_repository.project.name
  name        = "cloud/digitalocean"
  description = "Cloud Provider / Digital Ocean"
  color       = "068082"
}

resource "github_issue_label" "cloud_alicloud" {
  repository  = github_repository.project.name
  name        = "cloud/alicloud"
  description = "Cloud Provider / Alicloud"
  color       = "068082"
}

resource "github_issue_label" "cloud_exoscale" {
  repository  = github_repository.project.name
  name        = "cloud/exoscale"
  description = "Cloud Provider / Exoscale"
  color       = "068082"
}

resource "github_issue_label" "cloud_homelab" {
  repository  = github_repository.project.name
  name        = "cloud/homelab"
  description = "Cloud Provider / Homelab"
  color       = "068082"
}

resource "github_issue_label" "cloud_cicd" {
  repository  = github_repository.project.name
  name        = "cloud/cicd"
  description = "Cloud Provider / CICD"
  color       = "068082"
}

resource "github_issue_label" "needs_cloud" {
  repository  = github_repository.project.name
  name        = "needs/cloud"
  description = "Indicates a PR lacks a `cloud/foo` label and requires one."
  color       = "D669BE"
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
