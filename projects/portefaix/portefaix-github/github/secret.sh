#!/bin/bash

# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_TOKEN_NAME=galactus_github_prod_api_token
SECRET_API_TOKEN_VERSION=1

export TF_VAR_github_owner=portefaix #nlamirault
export TF_VAR_github_token=$(gcloud beta secrets versions access ${SECRET_API_TOKEN_VERSION} --secret=${SECRET_API_TOKEN_NAME} --project ${PROJECT})
