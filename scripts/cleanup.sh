#!/bin/bash

# format to use:
# ./architecture.sh

# STOP SCRIPT IF VARIABLE IS UNDEFINED
# set -u

# PARSE ENV
source ./parse-env.sh

# DOCKER
echo "Pruning local Docker images"
docker image prune

# CONTAINER REGISTRY
echo "Removing Docker images from Container Registry"
gcloud container images list-tags gcr.io/$SERVICE_NAME/vendure --filter='-tags:*' --format="get(digest)" --limit=100 > tags && while read p; do gcloud container images delete "gcr.io/$SERVICE_NAME/vendure@$p" --quiet; done < tags

# key.json
echo "Ensure key.json has been deleted"
FILE2=./key.json
if [ ! -f "$FILE2" ]; then
    echo "$FILE2 does not exist"
else 
    echo "$FILE2 exists"
    rimraf $FILE2
fi