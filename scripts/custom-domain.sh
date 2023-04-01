#!/bin/bash

# format to use:
# ./custom-domain.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# CUSTOM DOMAIN
echo "Creating Cloud Run Domain Mapping"
gcloud beta run domain-mappings create \
    --service=$SERVICE_NAME \
    --domain=$DOMAIN_URL \
    --region=$GCLOUD_REGION \
    --project=$GCLOUD_PROJECT 