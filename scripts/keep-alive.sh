#!/bin/bash

# format to use:
# ./keep-alive.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# KEEP ALIVE EVERY N MINUTES
echo "Creating 'keep alive' Cloud Scheduler Job"
gcloud scheduler jobs create http $SERVICE_NAME-prod-keep-alive \
    --location=$GCLOUD_REGION \
    --schedule="*/$KEEP_ALIVE_MINS * * * *" \
    --uri="$WORKER_HOST/admin" \
    --project=$GCLOUD_PROJECT