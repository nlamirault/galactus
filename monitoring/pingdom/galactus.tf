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

resource "pingdom_user" "owner" {
  username = "${var.username}"
}

resource "pingdom_team" "main_team" {
  name = "Main team"
}

resource "pingdom_contact" "owner_contact_email_1" {
  user_id        = "${pingdom_user.owner.id}"
  email          = "${var.contact_email}"
  severity_level = "LOW"
}

resource "pingdom_contact" "owner_contact_sms_1" {
  user_id        = "${pingdom_user.owner.id}"
  country_code   = "${element(split(":", var.contact_phone_number), 0)}"
  number         = "${element(split(":", var.contact_phone_number), 1)}"
  phone_provider = "nexmo"
  severity_level = "HIGH"
}

resource "pingdom_check" "box_external_access" {
  type       = "http"
  name       = "[Galactus] Box"
  host       = "${var.box_website_host}"
  port       = "${var.box_website_port}"
  encryption = true
  resolution = 5
  userids    = ["${pingdom_user.owner.id}"]
  tags       = "galactus"
}

resource "pingdom_check" "nicolas_website" {
  type       = "http"
  name       = "[Galactus] Nicolas website"
  host       = "${var.nicolas_website_host}"
  encryption = true
  resolution = 5
  userids    = ["${pingdom_user.owner.id}"]
  tags       = "galactus"
}

resource "pingdom_check" "cloud_website" {
  type       = "http"
  name       = "[Galactus] Cloud website"
  host       = "${var.cloud_website_host}"
  encryption = true
  resolution = 5
  userids    = ["${pingdom_user.owner.id}"]
  tags       = "galactus"
}
