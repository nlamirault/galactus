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

# Bento repository
# -------------------------------------------------------------------

resource "github_repository" "github-nlamirault-bento" {
  name        = "bento"
  description = "Some Vagrant baseboxes"

  has_issues         = true
  has_wiki           = true
  allow_merge_commit = true

  topics = ["packer", "vagrant", "virtualbox", "qemu", "galactus"]
}

module "github-nlamirault-bento-labels" {
  # source          = "git::https://github.com/nlamirault/galactus.git//github/modules/labels"
  source          = "../../../../terraform/github/labels"
  repository_name = "${github_repository.github-nlamirault-bento.name}"
}

resource "github_issue_label" "OS_ARCHLINUX" {
  repository = "${github_repository.github-nlamirault-bento.name}"
  name       = "os/archlinux"
  color      = "fbca04"
}

resource "github_issue_label" "OS_DEBIAN" {
  repository = "${github_repository.github-nlamirault-bento.name}"
  name       = "os/debian"
  color      = "fbca04"
}

resource "github_issue_label" "OS_VOIDLINUX" {
  repository = "${github_repository.github-nlamirault-bento.name}"
  name       = "os/voidlinux"
  color      = "fbca04"
}

resource "github_issue_label" "OS_CENTOS" {
  repository = "${github_repository.github-nlamirault-bento.name}"
  name       = "os/centos"
  color      = "fbca04"
}

resource "github_issue_label" "OS_FREEBSD" {
  repository = "${github_repository.github-nlamirault-bento.name}"
  name       = "os/freebsd"
  color      = "fbca04"
}

resource "github_issue_label" "OS_NETBSD" {
  repository = "${github_repository.github-nlamirault-bento.name}"
  name       = "os/netbsd"
  color      = "fbca04"
}

resource "github_issue_label" "OS_OPENBSD" {
  repository = "${github_repository.github-nlamirault-bento.name}"
  name       = "os/openbsd"
  color      = "fbca04"
}
