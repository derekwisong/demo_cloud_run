#!/bin/bash

# name of the app to deploy
NAME=demo-app

# path to the source code (contains main.py, requirements.txt)
SRC=demo_app/

# accept region as first argument
REGION=${1:-"us-east1"}

# deploy the app
gcloud run deploy $NAME \
    --source $SRC \
    --allow-unauthenticated \
    --region $REGION
