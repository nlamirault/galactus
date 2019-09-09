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

variable "gandi_apikey" {
  type        = "string"
  description = "The API key to used"
}

variable "gandi_sharing_id" {
  type        = "string"
  description = "The sharing ID to used"
}

variable "zone_name" {
  type        = "string"
  description = "Name of the zone"
}

variable "domain_name" {
  type        = "string"
  description = "Name of the domain"
}

variable "home_machines" {
  type        = "list"
  description = "Hosts in local network"
  default     = []
}

variable "cloud_record_value" {
  type        = "string"
  description = "Value of the Cloud website"
}

variable "status_record_value" {
  type        = "string"
  description = "Value of the Status website"
}

variable "monitoring_record_value" {
  type        = "string"
  description = "Value of the Monitoring website"
}
