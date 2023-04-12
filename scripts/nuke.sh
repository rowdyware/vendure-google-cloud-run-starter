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
gcloud storage rm --recursive gs://$BUCKET --quiet \
    --project=$GCLOUD_PROJECT

# SERVICE ACCCOUNT
echo "Removing service account for deployment"
gcloud iam service-accounts delete $SERVICE_ACCOUNT@$GCLOUD_PROJECT.iam.gserviceaccount.com --quiet \
    --project=$GCLOUD_PROJECT

# GITHUB ACTIONS
echo "Removing Repository secret for Service Account"
gh secret delete SA_KEY

# SECRETS
echo "RUNNING SECRETS DELETION SCRIPT"
source ./secrets-delete.sh

# DATABASE
echo "Removing Cloud SQL Instance"
gcloud sql instances delete $DB_NAME --quiet \
    --project=$GCLOUD_PROJECT

# DOCKER AND CONTAINER REGISTRY
echo "RUNNING CLEANUP SCRIPT"
source ./cleanup.sh
gcloud container images delete grc.io/$GCLOUD_PROJECT/vendure@latest --quiet

# CLOUD RUN
echo "Removing SERVER Cloud Run service"
gcloud run services delete $SERVICE_NAME --quiet \
    --region=$GCLOUD_REGION \
    --project=$GCLOUD_PROJECT 

# CLOUD RUN
echo "Removing WORKER Cloud Run service"
gcloud run services delete $WORKER_SERVICE_NAME --quiet \
    --region=$GCLOUD_REGION \
    --project=$GCLOUD_PROJECT 

# CUSTOM DOMAIN
echo "Removing Cloud Run custom domain"
gcloud beta run domain-mappings delete --quiet \
    --domain=$DOMAIN_URL \
    --region=$GCLOUD_REGION \
    --project=$GCLOUD_PROJECT 

# CLOUD SCHEDULER
echo "Removing 'keep alive' Cloud Scheduler Job"
gcloud scheduler jobs delete $SERVICE_NAME-prod-keep-alive --quiet \
    --location=$GCLOUD_REGION \
    --project=$GCLOUD_PROJECT