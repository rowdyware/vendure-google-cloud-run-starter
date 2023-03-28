#!/bin/bash

# format to use:
# ./secrets-create.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# SECRETS
echo "Creating secret: ${SERVICE_NAME}-app-env"
printf "$APP_ENV" | gcloud secrets create ${SERVICE_NAME}-app-env \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-gcloud-project"
printf "$GCLOUD_PROJECT" | gcloud secrets create ${SERVICE_NAME}-gcloud-project \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-bucket"
printf "$BUCKET" | gcloud secrets create ${SERVICE_NAME}-bucket \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-superadmin-username"
printf "$SUPERADMIN_USERNAME" | gcloud secrets create ${SERVICE_NAME}-superadmin-username \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-superadmin-password"
printf "$SUPERADMIN_PASSWORD" | gcloud secrets create ${SERVICE_NAME}-superadmin-password \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-db-host"
printf "$DB_HOST" | gcloud secrets create ${SERVICE_NAME}-db-host \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-socket-connection-name"
printf "$SOCKET_CONNECTION_NAME" | gcloud secrets create ${SERVICE_NAME}-socket-connection-name \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-db-password"
printf "$DB_PASSWORD" | gcloud secrets create ${SERVICE_NAME}-db-password \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-db-user"
printf "$DB_USER" | gcloud secrets create ${SERVICE_NAME}-db-user \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-db-name"
printf "$DB_NAME" | gcloud secrets create ${SERVICE_NAME}-db-name \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-worker-host"
printf "$WORKER_HOST" | gcloud secrets create ${SERVICE_NAME}-worker-host \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-cloud-tasks-secret"
printf "$CLOUD_TASKS_SECRET" | gcloud secrets create ${SERVICE_NAME}-cloud-tasks-secret \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-smtp-host"
printf "$SMTP_HOST" | gcloud secrets create ${SERVICE_NAME}-smtp-host \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-smtp-user"
printf "$SMTP_USER" | gcloud secrets create ${SERVICE_NAME}-smtp-user \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT

echo "Creating secret: ${SERVICE_NAME}-smtp-password"
printf "$SMTP_PASSWORD" | gcloud secrets create ${SERVICE_NAME}-smtp-password \
    --data-file=- \
    --locations=$GCLOUD_REGION \
    --replication-policy=user-managed \
    --project=$GCLOUD_PROJECT