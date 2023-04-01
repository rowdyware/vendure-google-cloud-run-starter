#!/bin/bash

# format to use:
# ./automation.sh

start_time=`date +%s`

FILE=../.env
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist"
    cp ../.env.example ../.env
    echo "Update your ENV VARS!"
    nano ../.env
    exit 1
else 
    echo "$FILE exists"
fi

PS3='Choose an option by entering a # and [Enter]: '

choices=("Test Locally - Setup" "Test Locally - Update" "Deployment - Initial Run" "Deployment - Update" "Deployment - Update Secrets" "Deployment - Update with Admin UI Recompile" "Cleanup" "Nuke Everything" "Exit")

select automation in "${choices[@]}"; do
    case $automation in
        "Test Locally - Setup")
            cd ..

            echo "BUILDING APP"
            yarn
            yarn build:admin
            yarn generate-migration:prod initial-startup
            yarn run-migration:prod

            echo "AUTHENTICATING GCLOUD"
            gcloud auth application-default login
            
            echo "STARTING SERVER LOCALY"
            yarn serve:prod

            break
            ;;
        "Test Locally - Update")
            cd ..

            yarn serve:prod

            break
            ;;
        "Deployment - Initial Run")
            echo "UPDATING GCLOUD COMPONENTS"
            gcloud components update

            echo "RUNNING CREATE SECRETS SCRIPT"
            source ./secrets-create.sh

            echo "RUNNING ARCHITECTURE SETUP SCRIPT"
            source ./architecture.sh

            echo "RUNNING DATABASE SETUP SCRIPT"
            source ./database.sh

            echo "BUILDING ADMIN UI"
            cd ..
            yarn build:admin
            yarn generate-migration:prod initial-startup
            yarn run-migration:prod
            cd scripts

            echo "RUNNING DOCKER IMAGE BUILD AND PUSH SCRIPT"
            source ./docker-build.sh

            echo "RUNNING DEPLOYMENT TO CLOUD RUN SCRIPT"
            source ./deploy.sh

            echo "INSTRUCTIONS: open .env and insert your WORKER_HOST URL listed in Service URL above:"
            echo "INSTRUCTIONS: save .env before continuing"

            # PAUSE PROMPT
            read -p "PRESS ANY KEY TO CONTINUE... " -n1 -s

            # PARSE ENV
            source ./parse-env.sh

            # UPDATE WORKER_HOST SECRET
            echo "Updating secret: ${SERVICE_NAME}-worker-host"
            printf "$WORKER_HOST" | gcloud secrets versions add ${SERVICE_NAME}-worker-host \
                --data-file=- \
                --project=$GCLOUD_PROJECT

            echo "RERUNNING DEPLOYMENT TO CLOUD RUN SCRIPT"
            source ./deploy.sh

            echo "RUNNING CUSTOM DOMAIN SCRIPT"
            source ./custom-domain.sh

            echo "RUNNING KEEP ALIVE PERFORMANCE SCRIPT"
            source ./keep-alive.sh

            echo "RUNNING CLEANUP SCRIPT"
            source ./cleanup.sh

            break
            ;;
        "Deployment - Update")
            echo "RUNNING DOCKER IMAGE BUILD AND PUSH SCRIPT"
            source ./docker-build.sh

            echo "RUNNING DEPLOYMENT TO CLOUD RUN SCRIPT"
            source ./deploy.sh

            break
            ;;
        "Deployment - Update Secrets")
            echo "RUNNING UPDATE SECRETS SCRIPT"
            source ./secrets-update.sh

            break
            ;;
        "Deployment - Update with Admin UI Recompile")
            echo "REBUILDING ADMIN UI"
            cd ..
            yarn build:admin
            cd scripts

            echo "RUNNING DOCKER IMAGE BUILD AND PUSH SCRIPT"
            source ./docker-build.sh

            echo "RUNNING DEPLOYMENT TO CLOUD RUN SCRIPT"
            source ./deploy.sh

            break
            ;;
        "Cleanup")
            echo "RUNNING CLEANUP SCRIPT"
            source ./cleanup.sh

            break
            ;;
        "Nuke Everything")
            echo "RUNNING NUCLEAR REMOVAL SCRIPT"
            source ./nuke.sh

            break
            ;;
        "Exit")
            echo "User requested exit"
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo "EL FIN!"

end_time=`date +%s`
runtime=$((end_time-start_time))
runtime_min=$((runtime/60))
runtime_secs=$((runtime%60))
echo "runtime: $runtime_min minutes and $runtime_secs seconds"