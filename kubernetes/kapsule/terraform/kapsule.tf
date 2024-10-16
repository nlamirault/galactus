# Copyright (C) 2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

module "kapsule" {
  source  = "nlamirault/kapsule/scaleway"
  version = "3.0.3"

  name              = var.name
  description       = var.description
  k8s_version       = var.k8s_version
  cni               = var.cni
  enable_dashboard  = var.enable_dashboard
  ingress           = var.ingress
  tags              = var.tags
  feature_gates     = var.feature_gates
  admission_plugins = var.admission_plugins

  enable_cluster_autoscaler     = var.enable_cluster_autoscaler
  scale_down_delay_after_add    = var.scale_down_delay_after_add
  scale_down_unneeded_time      = var.scale_down_unneeded_time
  estimator                     = var.estimator
  expander                      = var.expander
  ignore_daemonsets_utilization = var.ignore_daemonsets_utilization

  enable_auto_upgrade           = var.enable_auto_upgrade
  maintenance_window_start_hour = var.maintenance_window_start_hour
  maintenance_window_day        = var.maintenance_window_day

  node_pools = var.node_pools
}
