#!/bin/bash

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_KEY_NAME=galactus_gandi_prod_api_key
SECRET_API_KEY_VERSION=1

SECRET_HOME_IP_NAME=galactus_gandi_prod_home_ip
SECRET_HOME_IP_VERSION=1

export GANDI_KEY=$(gcloud beta secrets versions access ${SECRET_API_KEY_VERSION} --secret=${SECRET_API_KEY_NAME} --project ${PROJECT})
export TF_VAR_cloud_record_value=$(gcloud beta secrets versions access ${SECRET_HOME_IP_VERSION} --secret=${SECRET_HOME_IP_NAME} --project ${PROJECT})
export TF_VAR_homelab_record_value=${TF_VAR_cloud_record_value}
