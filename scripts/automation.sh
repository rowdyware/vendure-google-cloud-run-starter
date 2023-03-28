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

PS3='Choose an option by entering a #: '
choices=("Test Locally - Setup" "Test Locally - Update" "Deployment - Setup" "Deployment - Update" "Deployment - Update Secrets" "Deployment - Update with Admin UI Recompile" "Cleanup" "Nuke Everything" "Exit")
select automation in "${choices[@]}"; do
    case $automation in
        "Test Locally - Setup")
            cd ..

            yarn
            yarn build:admin
            yarn generate-migration:prod initial-startup
            yarn run-migration:prod
            gcloud auth application-default login
            yarn serve:prod

            break
            ;;
        "Test Locally - Update")
            cd ..

            yarn serve:prod

            break
            ;;
        "Deployment - Setup")
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
            cd scripts

            echo "RUNNING DOCKER IMAGE BUILD AND PUSH SCRIPT"
            source ./docker-build.sh

            echo "RUNNING DEPLOYMENT TO CLOUD RUN SCRIPT"
            source ./deploy.sh

            echo "INSTRUCTIONS: open .env and insert your WORKER_HOST URL retrieved from the Cloud Run dashboard after the first successful deploy"
            echo "INSTRUCTIONS: save .env before continuing"

            # PAUSE PROMPT
            read -p "PRESS ANY KEY TO CONTINUE... " -n1 -s

            echo "RERUNNING DEPLOYMENT TO CLOUD RUN SCRIPT"
            source ./deploy.sh

            echo "RUNNING KEEP ALIVE PERFORMANCE SCRIPT"
            source ./keep-alive.sh

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