#!/bin/bash

# format to use:
# ./keep-alive.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

echo "Creating 'keep alive' Cloud Scheduler Job"
gcloud scheduler jobs create http $SERVICE_NAME-prod-keep-alive \
    --location=$GCLOUD_REGION \
    --schedule="* 6-23 * * *" \
    --uri="https://$GCLOUD_PROJECT.a.run.app/admin" \
    --project=$GCLOUD_PROJECT