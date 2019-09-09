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

resource "cloudflare_record" "cloud" {
  domain   = "${var.cloudflare_zone}"
  name     = "${var.cloud_record_name}.${var.cloudflare_zone}"
  priority = "0"
  proxied  = false
  ttl      = "1"
  type     = "A"
  value    = "${var.cloud_record_value}"
}

resource "cloudflare_record" "nicolas" {
  domain   = "${var.cloudflare_zone}"
  name     = "${var.nicolas_record_name}.${var.cloudflare_zone}"
  priority = "0"
  proxied  = true
  ttl      = "1"
  type     = "CNAME"
  value    = "${var.nicolas_record_value}"
}

resource "cloudflare_record" "monitoring" {
  domain   = "${var.cloudflare_zone}"
  name     = "${var.monitoring_record_name}.${var.cloudflare_zone}"
  priority = "0"
  proxied  = true
  ttl      = "1"
  type     = "CNAME"
  value    = "${var.monitoring_record_value}"
}

resource "cloudflare_record" "status" {
  domain   = "${var.cloudflare_zone}"
  name     = "${var.status_record_name}.${var.cloudflare_zone}"
  priority = "0"
  proxied  = false
  ttl      = "1"
  type     = "CNAME"
  value    = "${var.status_record_value}"
}

# resource "cloudflare_zone" "lamirault--xyz" {
#   meta {
#     phishing_detected  = false
#     wildcard_proxiable = false
#   }
#   paused = false
#   plan   = "free"
#   type   = "full"
#   zone   = "lamirault.xyz"
# }
# resource "cloudflare_record" "A_lamirault--xyz_5f14b4f6c7137b97da965df26eac849c" {
#   domain   = "lamirault.xyz"
#   name     = "cloud.lamirault.xyz"
#   priority = "0"
#   proxied  = false
#   ttl      = "1"
#   type     = "A"
#   value    = "89.86.91.187"
# }
# resource "cloudflare_record" "test" {
#   domain = "${var.cloudflare_zone}"
#   name   = "${var.cloud_record_name}"
#   value  = "${var.cloud_record_value}"
#   type   = "A"
#   ttl    = 3600
# }

