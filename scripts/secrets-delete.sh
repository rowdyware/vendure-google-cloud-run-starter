#!/bin/bash

# format to use:
# ./secrets-update.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# SECRETS
echo "Deleting secret: ${SERVICE_NAME}-app-env"
gcloud secrets delete ${SERVICE_NAME}-app-env --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-gcloud-project"
gcloud secrets delete ${SERVICE_NAME}-gcloud-project --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-gcloud-region"
gcloud secrets delete ${SERVICE_NAME}-gcloud-region --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-bucket"
gcloud secrets delete ${SERVICE_NAME}-bucket --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-superadmin-username"
gcloud secrets delete ${SERVICE_NAME}-superadmin-username --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-superadmin-password"
gcloud secrets delete ${SERVICE_NAME}-superadmin-password --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-host"
gcloud secrets delete ${SERVICE_NAME}-db-host --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-socket-connection-name"
gcloud secrets delete ${SERVICE_NAME}-socket-connection-name --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-password"
gcloud secrets delete ${SERVICE_NAME}-db-password --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-user"
gcloud secrets delete ${SERVICE_NAME}-db-user --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-db-name"
gcloud secrets delete ${SERVICE_NAME}-db-name --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-worker-host"
gcloud secrets delete ${SERVICE_NAME}-worker-host --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-cloud-tasks-secret"
gcloud secrets delete ${SERVICE_NAME}-cloud-tasks-secret --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-smtp-host"
gcloud secrets delete ${SERVICE_NAME}-smtp-host --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-smtp-user"
gcloud secrets delete ${SERVICE_NAME}-smtp-user --quiet \
    --project=$GCLOUD_PROJECT

echo "Deleting secret: ${SERVICE_NAME}-smtp-password"
gcloud secrets delete ${SERVICE_NAME}-smtp-password --quiet \
    --project=$GCLOUD_PROJECT