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

terraform {
  required_version = ">= 0.14.0"

  required_providers {
    gandi = {
      # source  = "github/go-gandi/gandi"
      # version = "= 2.0.0"
      # source  = "manvalls/gandi"
      # version = "2.0.0-rc2-fork"
      # source  = "psychopenguin/gandi"
      # version = "2.0.0-rc3"
      source  = "rienafairefr/gandi"
      version = "1.1.2"
    }
    # gandi-2 = {
    #   source  = "manvalls/gandi"
    #   version = "2.0.0-rc2-fork-3"
    # }
  }
}
