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

# speedtest_exporter repository
# -------------------------------------------------------------------

locals {
  project     = "speedtest_exporter"
  description = "Prometheus exporter for Speedtest"
}

data "gitlab_user" "gitlab-nlamirault-user" {
  username = "${var.username}"
}

resource "gitlab_project" "speedtest_exporter" {
  name             = "${local.project}"
  description      = "${local.description}"
  visibility_level = "public"
  default_branch   = "master"
}

module "gitlab-nlamirault-speedtest_exporter-labels" {
  # source          = "git::https://github.com/nlamirault/galactus.git/terraform/github/labels"
  source       = "../../../../terraform/gitlab/labels"
  group_name   = "${var.username}"
  project_name = "${gitlab_project.speedtest_exporter.name}"
}

resource "gitlab_project_variable" "gitlab-speedtest_exporter-docker-hub-username" {
  project   = "${var.username}/${local.project}"
  key       = "DOCKER_USER"
  value     = "${var.docker_hub_username}"
  protected = true
}

resource "gitlab_project_variable" "gitlab-speedtest_exporter-docker-hub-password" {
  project   = "${var.username}/${local.project}"
  key       = "DOCKER_PASS"
  value     = "${var.docker_hub_password}"
  protected = true
}
