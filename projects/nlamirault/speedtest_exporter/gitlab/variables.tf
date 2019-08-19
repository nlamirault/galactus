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

variable "gitlab_token" {
  description = "(Optional) This is the Gitlab personal access token."
}

variable "username" {
  type        = "string"
  description = "The name of the user."
}

variable "docker_hub_username" {
  type        = "string"
  description = "The username of the Docker Hub account."
}

variable "docker_hub_password" {
  type        = "string"
  description = "The password of the Docker Hub account."
}
