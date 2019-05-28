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

resource "statuscake_test" "box_external_access" {
  website_name = "[Galactus] Box"
  website_url  = "${var.box_url}"
  test_type    = "HTTP"
  check_rate   = 300
  contact_id   = "${var.statuscake_contact_id}"
}

resource "statuscake_test" "nicolas_website" {
  website_name = "[Galactus] Nicolas website"
  website_url  = "${var.nicolas_website_url}"
  test_type    = "HTTP"
  check_rate   = 300
  contact_id   = "${var.statuscake_contact_id}"
}

resource "statuscake_test" "cloud_website" {
  website_name = "[Galactus] Cloud website"
  website_url  = "${var.cloud_website_url}"
  test_type    = "HTTP"
  check_rate   = 300
  contact_id   = "${var.statuscake_contact_id}"
}

resource "statuscake_test" "kubernetes_access" {
  website_name = "[Galactus] Kubernetes access"
  website_url  = "${var.kubernetes_access_host}"
  test_type    = "TCP"
  port         = "${var.kubernetes_access_port}"
  check_rate   = 300
  contact_id   = "${var.statuscake_contact_id}"
}

resource "statuscake_test" "synology_access" {
  website_name = "[Galactus] Synology access"
  website_url  = "${var.synology_access_host}"
  test_type    = "TCP"
  port         = "${var.synology_access_port}"
  check_rate   = 300
  contact_id   = "${var.statuscake_contact_id}"
}
