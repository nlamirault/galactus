#!/bin/bash

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_KEY_NAME=galactus_statuscake_prod_api_key
SECRET_API_KEY_VERSION=1

SECRET_USERNAME_NAME=galactus_statuscake_prod_username
SECRET_USERNAME_VERSION=1

export STATUSCAKE_APIKEY=$(gcloud beta secrets versions access ${SECRET_API_KEY_VERSION} --secret=${SECRET_API_KEY_NAME} --project ${PROJECT})
export STATUSCAKE_USERNAME=$(gcloud beta secrets versions access ${SECRET_USERNAME_VERSION} --secret=${SECRET_USERNAME_NAME} --project ${PROJECT})
