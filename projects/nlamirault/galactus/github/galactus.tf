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

resource "github_repository" "github-nlamirault-galactus" {
  name        = "galactus"
  description = "Terraform all my world"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  allow_merge_commit = true

  topics = ["terraform", "galactus"]
}

module "github-nlamirault-galactus-labels" {
  # source          = "git::https://github.com/nlamirault/galactus.git/terraform/github/labels"
  source          = "../../../../terraform/github/labels"
  repository_name = github_repository.github-nlamirault-galactus.name
}
