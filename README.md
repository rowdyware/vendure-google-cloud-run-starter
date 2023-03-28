# Vendure Google Cloud Run Starter

* Includes GitHub actions:
  * To deploy to test and production 
  * To run e2e tests on pull requests
  * To check if source is still valid according to Esling

## Setting up Vendure on Google Cloud

This project uses `your-project` as example name, so make sure to ctrl+f all files for occurences of `your-project` when you're done with this guide.

## Prerequisites

This guide assumes you have a GitHub repo clone/fork of the upstream repo and the following installed locally on your machine:
1. `gcloud` - [install](https://cloud.google.com/sdk/docs/install)
2. `gh` - [install](https://github.com/cli/cli#installation)
3. `mysql` client - `sudo apt install mysql-client-core-8.0`

## Create a Google Cloud project

1. Create a Google Cloud Project and store it's name in an env var
2. `EXPORT GCLOUD_PROJECT=your-project` or `set GCLOUD_PROJECT your-project`
3. Make sure the project has the following services enabled: `gcloud services enable compute.googleapis.com sqladmin.googleapis.com run.googleapis.com run.googleapis.com cloudtasks.googleapis.com storage.googleapis.com containerregistry.googleapis.com cloudscheduler.googleapis.com --project=$GCLOUD_PROJECT`

## Env vars
Copy the .env.example file and fill in your values.

## Test locally
1. `yarn build:admin`
2. `yarn generate-migration:prod initial-startup`
3. `yarn run-migration:prod`
4. `yarn serve:prod`

You should be able to access `http://localhost:3000/admin`, `http://localhost:3000/admin-api` and `http://localhost:3000/shop-api`

Test asset upload:
1. Before you start the server, run `gcloud auth application-default login`
2. Start Vendure and upload an asset. It should upload to your specified bucket


Go through the following files and replace any variables specific to your project: 
* All files in `.github/workflows`
* `deploy.sh`
* `build-docker.sh`

## Deployments

```
cd scripts && ./automation.sh
```

Still requires input:
- GitHub auth - 2 choices - GitHub.com, No
- After first DB_HOST spinup for IP
- Deleting SQL root user

ISSUES:
- could be database user host name - change to %

## Google Cloud Console
Some useful and important links to view your application health:

* https://console.cloud.google.com/logs/ Stack driver logging. All logs are written to a logfile named `winston_test` or `winston_prod`, depending on your APP_ENV value. You can display instance (worker or main) and plugin fiels by including `labels.module` and `labels.name` in the summary fields in Stack Driver.
* https://console.cloud.google.com/run to view your Cloud Run services and domains
* https://console.cloud.google.com/sql/instances to view your database server instances
* https://console.cloud.google.com/storage/browser to view your buckets and assets

## Admin UI compilation

When you add plugins that have custom UI, you need to add the plugin to `src/compile-admin-ui.ts` and run `yarn build:admin`. We commit the compiled files in `__admin-ui/dist` to git, to prevent recompilation on every deploy, because it can take quite long and is only necessary when UI changes have been introduces in `compile-admin-ui.ts`.

If you prefer to build the admin UI on every deploy, take a look at https://www.vendure.io/docs/plugins/extending-the-admin-ui/#compiling-as-a-deployment-step 