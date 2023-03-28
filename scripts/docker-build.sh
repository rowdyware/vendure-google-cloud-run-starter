#!/bin/bash

# format to use:
# ./docker-build.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
set -u

# PARSE ENV
source ./parse-env.sh

cd ..

echo "Building Docker image"
docker build . -t gcr.io/$GCLOUD_PROJECT/vendure

echo "Configuring Docker to use Google authentication"
gcloud auth configure-docker -q

echo "Pushing Docker image to Container Registry"
docker push gcr.io/$GCLOUD_PROJECT/vendure

cd scripts