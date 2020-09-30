#!/bin/bash

SECRET_API_KEY_NAME=galactus_statuscake_prod_api_key
SECRET_API_KEY_VERSION=1

SECRET_USERNAME_NAME=galactus_statuscake_prod_username
SECRET_USERNAME_VERSION=1

export STATUSCAKE_APIKEY=$(gcloud beta secrets versions access ${SECRET_API_KEY_VERSION} --secret=${SECRET_API_KEY_NAME})
export STATUSCAKE_USERNAME=$(gcloud beta secrets versions access ${SECRET_USERNAME_VERSION} --secret=${SECRET_USERNAME_NAME})
