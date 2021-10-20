#!/bin/bash

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_TOKEN_NAME=galactus_logzio_prod_api_token
SECRET_API_TOKEN_VERSION=1

SECRET_SLACK_URL_NAME=galactus_logzio_prod_slack_url
SECRET_SLACK_URL_VERSION=1

export LOGZIO_API_TOKEN=$(gcloud beta secrets versions access ${SECRET_API_TOKEN_VERSION} --secret=${SECRET_API_TOKEN_NAME} --project ${PROJECT})
export TF_VAR_slack_url=$(gcloud beta secrets versions access ${SECRET_SLACK_URL_VERSION} --secret=${SECRET_SLACK_URL_NAME} --project ${PROJECT})
