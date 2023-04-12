#!/bin/bash

# format to use:
# ./docker-build.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

# GCLOUD
echo "CONFIGURE GCLOUD CLI"
gcloud config set run/region $GCLOUD_REGION

echo "UPDATING GCLOUD COMPONENTS"
gcloud components update