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
  name        = "monitoring-mixins"
  description = "Monitoring mixins"

  has_issues         = true
  has_wiki           = true
  has_downloads      = true
  has_projects       = true
  allow_merge_commit = true

  topics = [
    "monitoring",
    "monitoring-mixins",
    "grafana",
    "prometheus",
    "galactus"
  ]
}

module "project_labels" {
  source  = "nlamirault/project/github//modules/labels"
  version = "1.2.0"

  repository_name = github_repository.project.full_name
}

resource "github_issue_label" "area_kubernetes" {
  repository  = github_repository.project.name
  name        = "area/kubernetes"
  description = "Kubernetes"
  color       = "cc317c"
}

resource "github_issue_label" "area_prometheus" {
  repository  = github_repository.project.name
  name        = "area/prometheus"
  description = "Helm"
  color       = "cc317c"
}

resource "github_issue_label" "area_prometheus_operator" {
  repository  = github_repository.project.name
  name        = "area/prometheus_operator"
  description = "Prometheus"
  color       = "cc317c"
}

resource "github_issue_label" "area_node_exporter" {
  repository  = github_repository.project.name
  name        = "area/node_exporter"
  description = "Node Exporter"
  color       = "cc317c"
}

resource "github_issue_label" "area_thanos" {
  repository  = github_repository.project.name
  name        = "area/thanos"
  description = "Helm"
  color       = "cc317c"
}

resource "github_issue_label" "area_alertmanager" {
  repository  = github_repository.project.name
  name        = "area/alertmanager"
  description = "Helm"
  color       = "cc317c"
}

resource "github_issue_label" "area_cert_manager" {
  repository  = github_repository.project.name
  name        = "area/cert_manager"
  description = "Thanos"
  color       = "cc317c"
}

resource "github_issue_label" "area_grafana" {
  repository  = github_repository.project.name
  name        = "area/grafana"
  description = "Grafana"
  color       = "cc317c"
}

resource "github_issue_label" "area_loki" {
  repository  = github_repository.project.name
  name        = "area/loki"
  description = "Loki"
  color       = "cc317c"
}

resource "github_issue_label" "area_promtail" {
  repository  = github_repository.project.name
  name        = "area/promtail"
  description = "Helm"
  color       = "cc317c"
}

resource "github_issue_label" "area_kube_state_metrics" {
  repository  = github_repository.project.name
  name        = "area/kube_state_metrics"
  description = "Promtail"
  color       = "cc317c"
}

resource "github_issue_label" "area_etcd" {
  repository  = github_repository.project.name
  name        = "area/etcd"
  description = "Etcd"
  color       = "cc317c"
}

resource "github_issue_label" "area_memcached" {
  repository  = github_repository.project.name
  name        = "area/memcached"
  description = "Memcached"
  color       = "cc317c"
}

resource "github_issue_label" "area_redis" {
  repository  = github_repository.project.name
  name        = "area/redis"
  description = "Redis"
  color       = "cc317c"
}

resource "github_issue_label" "area_minio" {
  repository  = github_repository.project.name
  name        = "area/minio"
  description = "Minio"
  color       = "cc317c"
}

resource "github_issue_label" "dependency_github" {
  repository  = github_repository.project.name
  name        = "dependency/github"
  description = "Dependency Github"
  color       = "6fcb70"
}

resource "github_issue_label" "dependency_jsonnet" {
  repository  = github_repository.project.name
  name        = "dependency/jsonnet"
  description = "Dependency Jsonnet"
  color       = "6fcb70"
}
