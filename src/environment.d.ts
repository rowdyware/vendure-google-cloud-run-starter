export { };

// Here we declare the members of the process.env object, so that we
// can use them in our application code in a type-safe manner.
declare global {
    namespace NodeJS {
        interface ProcessEnv {
            APP_ENV: string;
            APP_PORT: string;
            LOCAL_IP: string;
            GCLOUD_PROJECT: string;
            GCLOUD_REGION: string;
            SERVICE_NAME: string;
            SERVICE_ACCOUNT: string;
            BUCKET: string;
            SUPERADMIN_USERNAME: string;
            SUPERADMIN_PASSWORD: string;
            DB_HOST: string;
            SOCKET_CONNECTION_NAME: string;
            DB_ROOT_PASSWORD: string;
            DB_PASSWORD: string;
            DB_USER: string;
            DB_NAME: string;
            DB_TIER: string;
            WORKER_HOST: string;
            CLOUD_TASKS_SECRET: string;
            SMTP_HOST: string;
            SMTP_USER: string;
            SMTP_PASSWORD: string;
            KEEP_ALIVE_MINS: number
        }
    }
}
