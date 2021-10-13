#!/bin/bash

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_TOKEN_NAME=galactus_github_prod_api_token
SECRET_API_TOKEN_VERSION=1

export TF_VAR_github_owner=nlamirault
export TF_VAR_github_token=$(gcloud beta secrets versions access ${SECRET_API_TOKEN_VERSION} --secret=${SECRET_API_TOKEN_NAME} --project ${PROJECT})
