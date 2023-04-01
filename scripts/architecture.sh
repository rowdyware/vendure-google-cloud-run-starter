#!/bin/bash

# format to use:
# ./architecture.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# GCLOUD API
echo "Enabling GCloud services"
gcloud services enable compute.googleapis.com \
    sqladmin.googleapis.com \
    run.googleapis.com \
    cloudtasks.googleapis.com \
    storage.googleapis.com \
    containerregistry.googleapis.com \
    cloudscheduler.googleapis.com \
    --project=$GCLOUD_PROJECT

# BUCKET
echo "Creating asset storage bucket"
gcloud storage buckets create gs://$BUCKET \
    --project=$GCLOUD_PROJECT

# IAM
echo "Adding IAM policy bindings to asset storage bucket"
gcloud storage buckets add-iam-policy-binding gs://$BUCKET \
    --member=allUsers \
    --role=roles/storage.objectViewer

# SERVICE ACCOUNT
echo "Creating service account for deployment"
gcloud iam service-accounts create $SERVICE_ACCOUNT \
    --description="Automated deploys to cloud run and container building" \
    --display-name="Devops service account" \
    --project=$GCLOUD_PROJECT

echo "RUNNING SERVICE ACCOUNT IAM ROLES SCRIPT"
source ./iam.sh

echo "Creating service account JSON key"
gcloud iam service-accounts keys create key.json \
    --iam-account=$SERVICE_ACCOUNT@$GCLOUD_PROJECT.iam.gserviceaccount.com

# GITHUB ACTIONS
echo "Authenticating GitHub account"
gh auth login --hostname github.com --with-token <<< $GITHUB_PAT

echo "Adding Repository secret for Service Account"
gh secret set SA_KEY < key.json

echo "Deleting key.json"
rm key.json

echo "Adding Repository secret for .env"
gh secret set ENV_PROD < ../.env