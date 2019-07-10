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

data "slack_user" "owner" {
  name  = "nlamirault"
  email = "nicolas.lamirault@gmail.com"
}

resource "slack_channel" "main" {
  channel_name  = "${var.main_channel_name}"
  channel_topic = "${var.main_channel_topic}"

  # members = [
  #   "${data.slack_user.owner.id}",
  # ]
}

resource "slack_channel" "logzio" {
  channel_name  = "${var.logzio_channel_name}"
  channel_topic = "${var.logzio_channel_topic}"

  # members = [
  #   "${data.slack_user.owner.id}",
  # ]
}

resource "slack_channel" "alerting" {
  channel_name  = "${var.alerting_channel_name}"
  channel_topic = "${var.alerting_channel_topic}"

  # members = [
  #   "${data.slack_user.owner.id}",
  # ]
}

resource "slack_channel" "notification" {
  channel_name  = "${var.notification_channel_name}"
  channel_topic = "${var.notification_channel_topic}"

  # members = [
  #   "${data.slack_user.owner.id}",
  # ]
}
