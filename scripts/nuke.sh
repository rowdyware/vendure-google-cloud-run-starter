#!/bin/bash

# format to use:
# ./nuke.sh

# EXTRA CONFIRMATION BEFORE PROCEEDING
echo "Are you ABSOLUTELY sure you want to delete everything?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# BUCKET
echo "Removing asset storage bucket"
gcloud storage rm --recursive gs://$BUCKET \
    --project=$GCLOUD_PROJECT

# SERVICE ACCCOUNT
echo "Removing service account for deployment"
gcloud iam service-accounts delete $SERVICE_ACCOUNT \
    --project=$GCLOUD_PROJECT

# GITHUB ACTIONS
echo "Removing Repository secret for Service Account"
gh secret delete SA_KEY

# SECRETS
echo "RUNNING SECRETS DELETION SCRIPT"
source ./secrets-delete.sh

# DATABASE
echo "Removing Cloud SQL Instance"
gcloud sql instances delete $DB_NAME \
    --project=$GCLOUD_PROJECT

# DOCKER
echo "Pruning local Docker images"
docker image prune

# CONTAINER REGISTRY
echo "Removing Docker images from Container Registry"
gcloud container images list-tags gcr.io/$SERVICE_NAME/vendure --filter='-tags:*' --format="get(digest)" --limit=100 > tags && while read p; do gcloud container images delete "gcr.io/$SERVICE_NAME/vendure@$p" --quiet; done < tags
gcloud container images delete grc.io/$SERVICE_NAME/vendure@latest

# CLOUD RUN
echo "Removing Cloud Run service"
gcloud run services delete $SERVICE_NAME \
    --region=$GCLOUD_REGION \

# CLOUD SCHEDULER
echo "Removing 'keep alive' Cloud Scheduler Job"
gcloud scheduler jobs delete $SERVICE_NAME-prod-keep-alive \
    --location=$GCLOUD_REGION \
    --project=$GCLOUD_PROJECT