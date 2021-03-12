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

variable statuscake_contact_group {
  description = "ID of the contact group"
  type        = set(string)
}

variable box_url {
  type        = string
  description = "URL of the box"
}

variable nicolas_website_url {
  type        = string
  description = "URL of Nicolas website"
}

variable cloud_website_url {
  type        = string
  description = "URL of Cloud website"
}

variable kubernetes_access_host {
  type        = string
  description = "Hostname of the Kubernetes access"
}

variable kubernetes_access_port {
  type        = string
  description = "Port of the Kubernetes access"
}

variable synology_access_host {
  type        = string
  description = "Hostname of the Synology access"
}

variable synology_access_port {
  type        = string
  description = "Port of the Synology access"
}

variable kubernetes_access_host_cloud {
  type        = string
  description = "Hostname of the Kubernetes access Cloud"
}

variable kubernetes_access_port_cloud {
  type        = string
  description = "Port of the Kubernetes access Cloud"
}

variable synology_access_host_cloud {
  type        = string
  description = "Hostname of the Synology access Cloud"
}

variable synology_access_port_cloud {
  type        = string
  description = "Port of the Synology access Cloud"
}
