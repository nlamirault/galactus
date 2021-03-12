#!/bin/bash

SECRET_API_TOKEN_NAME=galactus_github_prod_api_token
SECRET_API_TOKEN_VERSION=1

export GITHUB_TOKEN=$(gcloud beta secrets versions access ${SECRET_API_TOKEN_VERSION} --secret=${SECRET_API_TOKEN_NAME})
