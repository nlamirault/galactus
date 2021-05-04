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
  name        = "portefaix-doc"
  description = "Documentation for portefaix"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  has_projects       = true
  allow_merge_commit = true

  pages {
    cname = "www.portefaix.xyz"
    source {
      branch = "gh-pages"
      path   = "/"
    }
  }

  topics = [
    "portefaix",
    "documentation",
    "galactus"
  ]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "0.3.0"

  repository_name = github_repository.project.name
}

resource "github_issue_label" "area_renovate" {
  repository  = github_repository.project.name
  name        = "area/renovate"
  description = "Renovate"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_nodejs" {
  repository  = github_repository.project.name
  name        = "dependency/nodejs"
  description = "Dependency NodeJS"
  color       = "6fcb70"
}
