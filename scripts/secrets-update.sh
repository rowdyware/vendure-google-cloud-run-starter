#!/bin/bash

# format to use:
# ./secrets-update.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# SECRETS
echo "Updating secret: ${SERVICE_NAME}-app-env"
printf "$APP_ENV" | gcloud secrets versions add ${SERVICE_NAME}-app-env \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-gcloud-project"
printf "$GCLOUD_PROJECT" | gcloud secrets versions add ${SERVICE_NAME}-gcloud-project \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-gcloud-region"
printf "$GCLOUD_REGION" | gcloud secrets versions add ${SERVICE_NAME}-gcloud-region \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-bucket"
printf "$BUCKET" | gcloud secrets versions add ${SERVICE_NAME}-bucket \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-superadmin-username"
printf "$SUPERADMIN_USERNAME" | gcloud secrets versions add ${SERVICE_NAME}-superadmin-username \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-superadmin-password"
printf "$SUPERADMIN_PASSWORD" | gcloud secrets versions add ${SERVICE_NAME}-superadmin-password \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-db-host"
printf "$DB_HOST" | gcloud secrets versions add ${SERVICE_NAME}-db-host \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-socket-connection-name"
printf "$SOCKET_CONNECTION_NAME" | gcloud secrets versions add ${SERVICE_NAME}-socket-connection-name \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-db-password"
printf "$DB_PASSWORD" | gcloud secrets versions add ${SERVICE_NAME}-db-password \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-db-user"
printf "$DB_USER" | gcloud secrets versions add ${SERVICE_NAME}-db-user \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-db-name"
printf "$DB_NAME" | gcloud secrets versions add ${SERVICE_NAME}-db-name \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-worker-host"
printf "$WORKER_HOST" | gcloud secrets versions add ${SERVICE_NAME}-worker-host \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-cloud-tasks-secret"
printf "$CLOUD_TASKS_SECRET" | gcloud secrets versions add ${SERVICE_NAME}-cloud-tasks-secret \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-smtp-host"
printf "$SMTP_HOST" | gcloud secrets versions add ${SERVICE_NAME}-smtp-host \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-smtp-user"
printf "$SMTP_USER" | gcloud secrets versions add ${SERVICE_NAME}-smtp-user \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Updating secret: ${SERVICE_NAME}-smtp-password"
printf "$SMTP_PASSWORD" | gcloud secrets versions add ${SERVICE_NAME}-smtp-password \
    --data-file=- \
    --project=$GCLOUD_PROJECT