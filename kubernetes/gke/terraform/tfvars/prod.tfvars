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

project = "galactus"

region = "europe-west1"

##############################################################################
# VPC

network_name = "jarvis"

subnet_cidr = "10.0.0.0/20"

secondary_ranges = {
    "jarvis" = [
      {
        range_name    = "jarvis-gke-services"
        ip_cidr_range = "10.0.16.0/20"
      },
      {
        range_name    = "jarvis-gke-pods"
        ip_cidr_range = "10.0.32.0/20"
      }
    ]
}

#############################################################################
# External IPs

external_ip_names = [
    "jarvis-cloud-nat-0",
    "jarvis-cloud-nat-1"
]

cloud_nat_labels = {
    "service" = "cloud-nat",
    "made-by" = "terraform"
}

#############################################################################
# Cloud NAT

nat_network            = "jarvis"
nat_name               = "jarvis-nat-gateway"
nat_router_name        = "jarvis-router"
nat_external_ip_0_name = "jarvis-cloud-nat-0"
nat_external_ip_1_name = "jarvis-cloud-nat-1"

min_ports_per_vm = 4000


###########################################################################
# Kubernetes cluster

location = "europe-west1-c"

name = "jarvis-cluster-gke"

# network        = "jarvis"
# subnet_network = "jarvis"

release_channel = "REGULAR"

network_config = {
  enable_natgw   = true
  enable_ssh     = false
  private_master = false
  private_nodes  = true
  pods_cidr     = "jarvis-gke-pods"
  services_cidr = "jarvis-gke-services"
}

master_ipv4_cidr_block = "10.0.63.0/28"

# bastion_external_ip_name = "jarvis-external-ip-bastion"
# nat_external_ip_0_name = "jarvis-external-ip-nat-0"
# nat_external_ip_1_name = "jarvis-external-ip-nat-1"

master_authorized_networks = [
  # Example :
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "internet"
    }
]

labels = {
  project = "jarvis"
  env      = "prod"
  service  = "kubernetes"
  made-by  = "terraform"
}

network_policy             = false
auto_scaling               = true
hpa                        = true
pod_security_policy        = false
monitoring_service         = true
logging_service            = true
binary_authorization       = false
google_cloud_load_balancer = true
istio                      = false
cloudrun                   = false
csi_driver                 = true
config_connector           = true
datapath_provider          = "ADVANCED_DATAPATH"

maintenance_start_time = "01:00"

default_max_pods_per_node = 110

###########################################################################
# Kubernetes node pool

node_labels = {
  node     = "core",
  project  = "jarvis"
  env      = "prod"
  service  = "kubernetes"
  made-by  = "terraform"
}

node_tags = ["kubernetes", "nodes"]

auto_upgrade = true
auto_repair  = true

#############################################################################
# Addons node pools

node_pools = [
    {
    name                    = "core"
    node_count              = 1
    min_node_count          = 0
    max_node_count          = 1
    machine_type            = "n1-standard-1"
    disk_size_gb            = 100
    max_pods_per_node       = 110
    preemptible             = true
    default_service_account = false
  },
  {
    name                    = "ops"
    node_count              = 0
    min_node_count          = 0
    max_node_count          = 1
    machine_type            = "n1-standard-1"
    disk_size_gb            = 100
    max_pods_per_node       = 110
    preemptible             = true
    default_service_account = false
  }
]


############################################################################
# Firewall

source_ranges = [
  "10.0.16.0/20", # Pods
  "10.0.32.0/20", # Services
  "10.0.0.0/20"   # VPC
]
