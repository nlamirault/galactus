#!/bin/bash

PROJECT=$1
[ -z "${PROJECT}" ] && echo_fail "Cloud project not satisfied" && exit 1

SECRET_API_ACCESS_KEY_NAME=galactus_scaleway_prod_api_access_key
SECRET_API_ACCESS_KEY_VERSION=1

SECRET_API_SECRET_KEY_NAME=galactus_scaleway_prod_api_secret_key
SECRET_API_SECRET_KEY_VERSION=1

# SECRET_API_ORGANIZATION_ID_NAME=galactus_scaleway_prod_api_organization_id
# SECRET_API_ORGANIZATION_ID_VERSION=1

SECRET_API_PROJECT_ID_NAME=galactus_scaleway_prod_api_project_id
SECRET_API_PROJECT_ID_VERSION=1

export SCW_ACCESS_KEY=$(gcloud beta secrets versions access ${SECRET_API_ACCESS_KEY_VERSION} --secret=${SECRET_API_ACCESS_KEY_NAME} --project ${PROJECT})
export SCW_SECRET_KEY=$(gcloud beta secrets versions access ${SECRET_API_SECRET_KEY_VERSION} --secret=${SECRET_API_SECRET_KEY_NAME} --project ${PROJECT})
# export SCW_DEFAULT_ORGANIZATION_ID=$(gcloud beta secrets versions access ${SECRET_API_ORGANIZATION_ID_VERSION} --secret=${SECRET_API_ORGANIZATION_ID_NAME})
# export SCW_PROJECT_ID=$(gcloud beta secrets versions access ${SECRET_API_ORGANIZATION_ID_VERSION} --secret=${SECRET_API_ORGANIZATION_ID_NAME})
export SCW_DEFAULT_PROJECT_ID=$(gcloud beta secrets versions access ${SECRET_API_PROJECT_ID_VERSION} --secret=${SECRET_API_PROJECT_ID_NAME} --project ${PROJECT})
export SCW_DEFAULT_ORGANIZATION_ID="${SCW_DEFAULT_PROJECT_ID}"
