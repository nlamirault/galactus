# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
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

resource "github_organization_project" "aws" {
  name = "portefaix-aws"
  body = "Portefaix on AWS"
}

resource "github_organization_project" "azure" {
  name = "portefaix-azure"
  body = "Portefaix on Azure"
}

resource "github_organization_project" "gcp" {
  name = "portefaix-gcp"
  body = "Portefaix on GCP"
}

resource "github_organization_project" "k3s" {
  name = "portefaix-k3s"
  body = "Portefaix on Homelab"
}

resource "github_organization_project" "kind" {
  name = "portefaix-kind"
  body = "Portefaix on Homelab"
}

resource "github_organization_project" "scaleway" {
  name = "portefaix-scaleway"
  body = "Portefaix on Scaleway"
}

resource "github_organization_project" "exoscale" {
  name = "portefaix-exoscale"
  body = "Portefaix on Exoscale"
}

resource "github_organization_project" "bug" {
  name = "portefaix-bug"
  body = "Bugs of the Portefaix project"
}