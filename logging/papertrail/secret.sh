#!/bin/bash

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_TOKEN_NAME=galactus_papertrail_prod_api_token
SECRET_API_TOKEN_VERSION=1

export PAPERTRAIL_TOKEN=$(gcloud beta secrets versions access ${SECRET_API_TOKEN_VERSION} --secret=${SECRET_API_TOKEN_NAME} --project ${PROJECT})
