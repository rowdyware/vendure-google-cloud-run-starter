#!/bin/bash

# format to use:
# ./iam.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# IAM
echo "Granting service account roles"
gcloud projects add-iam-policy-binding $GCLOUD_PROJECT \
    --member="serviceAccount:$SERVICE_ACCOUNT@$GCLOUD_PROJECT.iam.gserviceaccount.com" \
    --role="roles/editor"

gcloud projects add-iam-policy-binding $GCLOUD_PROJECT \
    --member="serviceAccount:$SERVICE_ACCOUNT@$GCLOUD_PROJECT.iam.gserviceaccount.com" \
    --role="roles/secretmanager.secretAccessor"