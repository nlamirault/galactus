# Copyright (C) 2018-2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

data "cloudflare_zones" "portefaix" {
  filter {
    name = "portefaix.xyz"
  }
}

resource "cloudflare_record" "portefaix" {
  for_each = var.portefaix_records

  zone_id  = data.cloudflare_zones.portefaix.zones[0].id
  name     = format("%s.%s", each.key, data.cloudflare_zones.portefaix.zones[0].name)
  priority = each.value.priority
  proxied  = each.value.proxied
  ttl      = each.value.ttl
  type     = each.value.type
  value    = each.value.value
}
