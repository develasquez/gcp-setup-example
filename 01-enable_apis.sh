# Axmos Technologies 
# Axmos Back End Example is an Open Source Project
# This file is just an example and is distributed without any warranty
# Made with love

#!/bin/bash


apis() {
# Establecer el proyecto por defecto
gcloud config set project $PROJECT_ID

# Habilitar todas las APIs necesarias
gcloud services enable \
  compute.googleapis.com \
  sqladmin.googleapis.com \
  servicenetworking.googleapis.com \
  vpcaccess.googleapis.com \
  cloudresourcemanager.googleapis.com \
  run.googleapis.com \
  cloudbuild.googleapis.com \
  bigquery.googleapis.com \
  secretmanager.googleapis.com \
  artifactregistry.googleapis.com;

# Mensaje de confirmación
echo "Todas las APIs necesarias han sido habilitadas en el proyecto $PROJECT_ID."

}