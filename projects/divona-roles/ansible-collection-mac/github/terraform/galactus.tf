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
  name        = "ansible-collection-mac"
  description = "Ansible Collection for Mac workstation"

  has_issues             = true
  has_wiki               = true
  has_downloads          = true
  has_projects           = true
  allow_merge_commit     = true
  delete_branch_on_merge = true
  vulnerability_alerts   = true

  security_and_analysis {
    advanced_security {
      status = "enabled"
    }

    secret_scanning {
      status = "disabled"
    }

    secret_scanning_push_protection {
      status = "disabled"
    }
  }

  # pages {
  #   source {
  #     branch = "gh-pages"
  #     path   = "/"
  #   }
  # }

  topics = ["ansible", "ansible-collection", "mac", "osx", "divona", "galactus"]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "1.2.0"

  repository_name = github_repository.project.full_name
}

resource "github_issue_label" "area_github" {
  repository  = github_repository.project.name
  name        = "area/github"
  description = "Github"
  color       = "cc317c"
}

resource "github_issue_label" "area_ansible" {
  repository  = github_repository.project.name
  name        = "area/ansible"
  description = "Ansible"
  color       = "cc317c"
}

resource "github_issue_label" "area_renovate" {
  repository  = github_repository.project.name
  name        = "area/renovate"
  description = "Renovate"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_github" {
  repository  = github_repository.project.name
  name        = "dependency/github"
  description = "Dependency Github"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_ansible" {
  repository  = github_repository.project.name
  name        = "dependency/ansible"
  description = "Dependency Ansible"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_python" {
  repository  = github_repository.project.name
  name        = "dependency/python"
  description = "Dependency Python"
  color       = "6fcb70"
}
