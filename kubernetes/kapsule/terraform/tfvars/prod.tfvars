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

#####################################################################""
# Provider

region = "fr-par"

zone = "fr-par-1"

##############################################################################
# Kubernetes cluster

name        = "jarvis-kapsule"
description = "Jarvis on Kubernetes"

k8s_version = "1.18"

cni = "cilium"

ingress = "nginx"

tags = ["terraform", "jarvis"]

feature_gates = []

admission_plugins = []

enable_cluster_autoscaler       = true
disable_scale_down              = false
scale_down_delay_after_add      = "5m"
estimator                       = "binpacking"
expander                        = "random"
ignore_daemonsets_utilization   = true
balance_similar_node_groups     = true
expendable_pods_priority_cutoff = -5

enable_auto_upgrade           = true
maintenance_window_start_hour = 4
maintenance_window_day        = "monday"

node_pools = {
  "core" = {
    "node_type"           = "DEV1_M"
    "size"                = 1
    "min_size"            = 1
    "max_size"            = 1
    "autoscaling"         = true
    "autohealing"         = true
    "wait_for_pool_ready" = true
    "tags"                = ["prod", "core", "terraform"]
  },
  "ops" = {
    "node_type"           = "DEV1_M"
    "size"                = 1
    "min_size"            = 1
    "max_size"            = 1
    "autoscaling"         = true
    "autohealing"         = false
    "wait_for_pool_ready" = true
    "tags"                = ["prod", "ops", "terraform"]
  }
}
