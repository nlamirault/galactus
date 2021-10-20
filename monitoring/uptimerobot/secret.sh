#!/bin/bash

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_KEY_NAME=galactus_uptimerobot_prod_api_key
SECRET_API_KEY_VERSION=1

export UPTIMEROBOT_API_KEY=$(gcloud beta secrets versions access ${SECRET_API_KEY_VERSION} --secret=${SECRET_API_KEY_NAME} --project ${PROJECT})
