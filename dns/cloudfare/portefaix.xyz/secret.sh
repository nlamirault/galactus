#!/bin/bash

SECRET_EMAIL_NAME=galactus_cloudflare_prod_email
SECRET_EMAIL_VERSION=1

SECRET_API_KEY_NAME=galactus_cloudflare_prod_api_key
SECRET_API_KEY_VERSION=1

export CLOUDFLARE_EMAIL=$(gcloud beta secrets versions access ${SECRET_EMAIL_VERSION} --secret=${SECRET_EMAIL_NAME})
export CLOUDFLARE_API_KEY=$(gcloud beta secrets versions access ${SECRET_API_KEY_VERSION} --secret=${SECRET_API_KEY_NAME})
