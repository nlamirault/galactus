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

variable "slack_token" {
  description = "Slack legacy token"
}

variable "main_channel_name" {
  type        = "string"
  description = "Name of the main channel"
}

variable "main_channel_topic" {
  type        = "string"
  description = "Topic of the main channel"
}

variable "logzio_channel_name" {
  type        = "string"
  description = "Name of the Logz.io channel"
}

variable "logzio_channel_topic" {
  type        = "string"
  description = "Topic of the Logz.io channel"
}

variable "alerting_channel_name" {
  type        = "string"
  description = "Name of the alerting channel"
}

variable "alerting_channel_topic" {
  type        = "string"
  description = "Topic of the alerting channel"
}

variable "notification_channel_name" {
  type        = "string"
  description = "Name of the notification channel"
}

variable "notification_channel_topic" {
  type        = "string"
  description = "Topic of the notification channel"
}

variable "jarvis_channel_name" {
  type        = "string"
  description = "Name of the Jarvis channel"
}

variable "jarvis_channel_topic" {
  type        = "string"
  description = "Topic of the Jarvis channel"
}
