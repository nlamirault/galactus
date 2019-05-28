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

variable "pingdom_username" {
  description = "Pingdom account username"
}

variable "pingdom_password" {
  description = "Pingdom account password"
}

variable "pingdom_apikey" {
  description = "The API key to used"
}

variable "username" {
  type        = "string"
  description = "Username of the owner"
}

variable "contact_email" {
  type        = "string"
  description = "Email of the contact"
}

variable "contact_phone_number" {
  type        = "string"
  description = "Phone number of the contact"
}

variable "box_website_host" {
  type        = "string"
  description = "Hostname of the box"
}

variable "box_website_port" {
  type        = "string"
  description = "Port of the box"
}

variable "nicolas_website_host" {
  type        = "string"
  description = "Hostname of Nicolas website"
}

variable "cloud_website_host" {
  type        = "string"
  description = "Hostname of Cloud website"
}
