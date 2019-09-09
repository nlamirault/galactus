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

variable "cloudflare_email" {
  type        = "string"
  description = "The email associated with the Cloudfare account"
}

variable "cloudflare_token" {
  type        = "string"
  description = "The Cloudflare API key"
}

variable "cloudflare_zone" {
  type        = "string"
  description = "Name of the zone"
}

variable "nicolas_record_name" {
  type = "string"
}

variable "nicolas_record_value" {
  type = "string"
}

variable "cloud_record_value" {
  type = "string"
}

variable "cloud_record_name" {
  type = "string"
}

variable "status_record_name" {
  type = "string"
}

variable "status_record_value" {
  type = "string"
}

variable "monitoring_record_name" {
  type = "string"
}

variable "monitoring_record_value" {
  type = "string"
}
