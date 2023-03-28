#!/bin/bash

# format to use:
# ./secrets-update.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# SECRETS
echo "Deleting secret: ${SERVICE_NAME}-app-env"
gcloud secrets versions delete ${SERVICE_NAME}-app-env \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-gcloud-project"
gcloud secrets versions delete ${SERVICE_NAME}-gcloud-project \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-gcloud-region"
gcloud secrets versions delete ${SERVICE_NAME}-gcloud-region \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-bucket"
gcloud secrets versions delete ${SERVICE_NAME}-bucket \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-superadmin-username"
gcloud secrets versions delete ${SERVICE_NAME}-superadmin-username \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-superadmin-password"
gcloud secrets versions delete ${SERVICE_NAME}-superadmin-password \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-host"
gcloud secrets versions delete ${SERVICE_NAME}-db-host \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-socket-connection-name"
gcloud secrets versions delete ${SERVICE_NAME}-socket-connection-name \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-password"
gcloud secrets versions delete ${SERVICE_NAME}-db-password \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-user"
gcloud secrets versions delete ${SERVICE_NAME}-db-user \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-name"
gcloud secrets versions delete ${SERVICE_NAME}-db-name \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-worker-host"
gcloud secrets versions delete ${SERVICE_NAME}-worker-host \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-cloud-tasks-secret"
gcloud secrets versions delete ${SERVICE_NAME}-cloud-tasks-secret \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-smtp-host"
gcloud secrets versions delete ${SERVICE_NAME}-smtp-host \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-smtp-user"
gcloud secrets versions delete ${SERVICE_NAME}-smtp-user \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-smtp-password"
gcloud secrets versions delete ${SERVICE_NAME}-smtp-password \
    --project=$GCLOUD_PROJECT