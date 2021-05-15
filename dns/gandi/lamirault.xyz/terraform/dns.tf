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

data "gandi_zone" "main" {
  name = var.zone_name
}

resource "gandi_domainattachment" "main" {
  domain = var.domain_name
  zone   = data.gandi_zone.main.id
}

resource "gandi_zonerecord" "cloud_record" {
  zone   = data.gandi_zone.main.id
  name   = var.cloud_record_name
  type   = "A"
  ttl    = "1800"
  values = [var.cloud_record_value]
}

resource "gandi_zonerecord" "homelab_record" {
  zone   = data.gandi_zone.main.id
  name   = var.cloud_record_name
  type   = "A"
  ttl    = "1800"
  values = [var.cloud_record_value]
}

resource "gandi_zonerecord" "status_record" {
  zone   = data.gandi_zone.main.id
  name   = var.status_record_name
  type   = "CNAME"
  ttl    = "1800"
  values = [var.status_record_value]
}

resource "gandi_zonerecord" "monitoring_record" {
  zone   = data.gandi_zone.main.id
  name   = var.monitoring_record_name
  type   = "CNAME"
  ttl    = "1800"
  values = [var.monitoring_record_value]
}

resource "gandi_zonerecord" "nicolas_record" {
  zone   = data.gandi_zone.main.id
  name   = var.nicolas_record_name
  type   = "CNAME"
  ttl    = "1800"
  values = [var.nicolas_record_value]
}

resource "gandi_zonerecord" "home" {
  count  = length(var.home_machines)
  zone   = data.gandi_zone.main.id
  name   = element(split(":", element(var.home_machines, count.index)), 0)
  type   = "A"
  ttl    = 3600
  values = ["192.168.0.${element(split(":", element(var.home_machines, count.index)), 1)}"]
}
