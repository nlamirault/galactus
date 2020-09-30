#!/bin/bash

SECRET_API_KEY_NAME=galactus_uptimerobot_prod_api_key
SECRET_API_KEY_VERSION=1

export UPTIMEROBOT_API_KEY=$(gcloud beta secrets versions access ${SECRET_API_KEY_VERSION} --secret=${SECRET_API_KEY_NAME})
