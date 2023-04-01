#!/bin/bash

# format to use:
# ./database.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

echo "Creating Cloud SQL instance"
gcloud sql instances create $DB_NAME \
    --database-version=MYSQL_8_0 \
    --tier=$DB_TIER \
    --region=$GCLOUD_REGION \
    --root-password=$DB_ROOT_PASSWORD \
    --assign-ip \
    --storage-auto-increase \
    --storage-size=20GB \
    --authorized-networks=$LOCAL_IP \
    --maintenance-window-day=MON \
    --maintenance-window-hour=2 \
    --availability-type=regional \
    --enable-bin-log \
    --backup \
    --retained-backups-count=30 \
    --storage-type=SSD \
    --project=$GCLOUD_PROJECT

echo "Creating Cloud SQL database"
gcloud sql databases create $DB_NAME \
    --instance=$DB_NAME \
    --charset=utf8mb4 \
    --collation=utf8mb4_unicode_ci \
    --project=$GCLOUD_PROJECT

echo "INSTRUCTIONS: open .env and insert your DB_HOST IP address retrieved from the Cloud SQL dashboard"
echo "INSTRUCTIONS: save .env before continuing"

# PAUSE PROMPT
read -p "PRESS ANY KEY TO CONTINUE... " -n1 -s

# PARSE ENV
source ./parse-env.sh

# UPDATE DB_HOST SECRET
echo "Updating secret: ${SERVICE_NAME}-db-host"
printf "$DB_HOST" | gcloud secrets versions add ${SERVICE_NAME}-db-host \
    --data-file=- \
    --project=$GCLOUD_PROJECT

echo "Creating user for Cloud SQL database"
gcloud sql users create $DB_USER \
    --instance=$DB_NAME, -i $DB_NAME \
    --host=% \
    --password=$DB_PASSWORD \
    --project=$GCLOUD_PROJECT

echo "Deleting root user for Cloud SQL database"
gcloud sql users delete root --quiet \
    --instance=$DB_NAME, -i $DB_NAME \
    --host=% \
    --project=$GCLOUD_PROJECT