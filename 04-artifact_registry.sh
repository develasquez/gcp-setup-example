# Axmos Technologies 
# Axmos Back End Example is an Open Source Project
# This file is just an example and is distributed without any warranty
# Made with love

#!/bin/bash

artifact() {
    gcloud artifacts repositories create $STARTUP_NAME \
    --repository-format=Docker \
    --location=southamerica-west1 \
    --project=$PROJECT_ID \
    --description="Repositorio de imágenes para startup-service"
}