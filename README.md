# Vendure Google Cloud Run Starter

* Includes GitHub actions:
  * To deploy to test and production 
  * To run e2e tests on pull requests
  * To check if source is still valid according to Esling

## Setting up Vendure on Google Cloud



## Prerequisites

This guide assumes you have a GitHub repo clone/fork of the upstream repo and the following installed locally on your machine:
1. bash
2. nvm 
3. yarn
4. `gcloud` - [install](https://cloud.google.com/sdk/docs/install)
5. `gcloud beta`
6. `gh` - [install](https://github.com/cli/cli#installation)
7. A Google Cloud Project - store the ProjectId in an env var `GCLOUD_PROJECT`
8. DNS records for your custom domain - `CNAME @ ghs.googlehosted.com`

## Env vars
Copy the .env.example file and fill in your values.

This project uses `your-project` as example name, so make sure to ctrl+f all files for occurences of `your-project` when you're done with this guide.

Go through the following files and replace `your-project` with env vars specific to your project: 
* All files in `.github/workflows`

## Dev, Deployments, Cleanup

```
nvm use 16
cd scripts
./automation.sh
```

## Google Cloud Console
Some useful and important links to view your application health:

* https://console.cloud.google.com/logs/ Stack driver logging. All logs are written to a logfile named `winston_test` or `winston_prod`, depending on your APP_ENV value. You can display instance (worker or main) and plugin fiels by including `labels.module` and `labels.name` in the summary fields in Stack Driver.
* https://console.cloud.google.com/run to view your Cloud Run services and domains
* https://console.cloud.google.com/sql/instances to view your database server instances
* https://console.cloud.google.com/storage/browser to view your buckets and assets

## Admin UI compilation

When you add plugins that have custom UI, you need to add the plugin to `src/compile-admin-ui.ts` and run `yarn build:admin`. We commit the compiled files in `__admin-ui/dist` to git, to prevent recompilation on every deploy, because it can take quite long and is only necessary when UI changes have been introduces in `compile-admin-ui.ts`.

If you prefer to build the admin UI on every deploy, take a look at https://www.vendure.io/docs/plugins/extending-the-admin-ui/#compiling-as-a-deployment-step 

## Credit
Forked from [pinelab-studio/vendure-google-cloud-run-starter](https://github.com/Pinelab-studio/vendure-google-cloud-run-starter)