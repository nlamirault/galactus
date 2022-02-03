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

resource "uptimerobot_monitor" "nicolas_website" {
  url           = var.nicolas_website_url
  type          = "http"
  friendly_name = "[Galactus] Nicolas website"

  alert_contact {
    id = data.uptimerobot_alert_contact.default_alert_contact.id
  }
}

resource "uptimerobot_monitor" "cloud_website" {
  url           = var.cloud_website_url
  type          = "http"
  friendly_name = "[Galactus] Cloud website"

  alert_contact {
    id = data.uptimerobot_alert_contact.default_alert_contact.id
  }
}

resource "uptimerobot_monitor" "synology_access_cloud" {
  url           = var.synology_access_host_cloud
  type          = "port"
  sub_type      = "custom"
  port          = var.synology_access_port_cloud
  friendly_name = "[Galactus] Synology SSH Cloud"

  alert_contact {
    id = data.uptimerobot_alert_contact.default_alert_contact.id
  }
}
