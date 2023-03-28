#!/bin/bash

# format to use:
# ./deploy.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

echo "Deploying Docker image to Cloud Run"
gcloud run deploy $SERVICE_NAME \
    --quiet \
    --image "gcr.io/$GCLOUD_PROJECT/vendure:latest" \
    --region=$GCLOUD_REGION \
    --platform "managed" \
    --allow-unauthenticated \
    --project=$GCLOUD_PROJECT \
    --service-account=$SERVICE_ACCOUNT \
    --port=$APP_PORT \
    --add-cloudsql-instances="$SOCKET_CONNECTION_NAME" \
    --memory=$MEMORY \
    --set-secrets APP_ENV=$SERVICE_NAME-app-env:latest \
    --set-secrets GCLOUD_PROJECT=$SERVICE_NAME-gcloud-project:latest \
    --set-secrets BUCKET=$SERVICE_NAME-bucket:latest \
    --set-secrets SUPERADMIN_USERNAME=$SERVICE_NAME-superadmin-username:latest \
    --set-secrets SUPERADMIN_PASSWORD=$SERVICE_NAME-superadmin-password:latest \
    --set-secrets DB_HOST=$SERVICE_NAME-db-host:latest \
    --set-secrets SOCKET_CONNECTION_NAME=$SERVICE_NAME-socket-connection-name:latest \
    --set-secrets DB_PASSWORD=$SERVICE_NAME-db-password:latest \
    --set-secrets DB_USER=$SERVICE_NAME-db-user:latest \
    --set-secrets DB_NAME=$SERVICE_NAME-db-name:latest \
    --set-secrets WORKER_HOST=$SERVICE_NAME-worker-host:latest \
    --set-secrets CLOUD_TASKS_SECRET=$SERVICE_NAME-cloud-tasks-secret:latest \
    --set-secrets SMTP_HOST=$SERVICE_NAME-smtp-host:latest \
    --set-secrets SMTP_USER=$SERVICE_NAME-smtp-user:latest \
    --set-secrets SMTP_PASSWORD=$SERVICE_NAME-smtp-password:latest 