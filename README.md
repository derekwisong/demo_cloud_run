# Minimal Cloud Run Demo App

_It's assumed that you've set up the [gcloud cli](https://cloud.google.com/sdk/gcloud)._

## Instructions

There is a `deploy.bash` script that runs a deployment similar to below.

### Steps to Deploy Manually

1. Deploy the code from the `demo_app/` subdirectory as a service named `demo-app`.In my case I want a specific 
   region, and specify it at the command line.

   ```bash
   $ gcloud run deploy demo-app --region us-east1 --source demo_app
   ```

2. Wait for `gcloud` to finish. It can take a minute or two.

The output looks something like:

```bash
$ gcloud run deploy demo-app --region us-east1 --source demo_app

Deploying from source requires an Artifact Registry Docker repository to store built containers. A repository named [cloud-run-source-deploy] in region [us-east1] will be created.

Do you want to continue (Y/n)?  y
This command is equivalent to running `gcloud builds submit --pack image=[IMAGE] demo_app` and `gcloud run deploy demo-app --image [IMAGE]`

Allow unauthenticated invocations to [demo-app] (y/N)?  y

Building using Buildpacks and deploying container to Cloud Run service [demo-app] in project [REDACTED] region [us-east1]
✓ Building and deploying new service... Done.
  ✓ Creating Container Repository...
  ✓ Uploading sources...                                         
  ✓ Building Container... Logs are available at [REDACTED].
  ✓ Creating Revision...
  ✓ Routing traffic...
  ✓ Setting IAM Policy...                              

Done.

Service [demo-app] revision [demo-app-REDACTED] has been deployed and is serving 100 percent of traffic.
Service URL: https://REDACTED.a.run.app
```

## Observe the Service is Running

```bash
$ echo $(curl -s https://REDACTED.a.run.app)
Hello World!
```