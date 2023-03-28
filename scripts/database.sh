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
    --availability-type=zonal \
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

# host=cloudsqlproxy~$DB_HOST
echo "Creating user for Cloud SQL database"
gcloud sql users create $DB_USER \
    --instance=$DB_NAME, -i $DB_NAME \
    --host=% \
    --password=$DB_PASSWORD \
    --project=$GCLOUD_PROJECT

echo "Deleting root user for Cloud SQL database"
gcloud sql users delete root \
    --instance=$DB_NAME, -i $DB_NAME \
    --host=cloudsqlproxy~$DB_HOST \
    --project=$GCLOUD_PROJECT