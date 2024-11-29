# Axmos Technologies 
# Axmos Back End Example is an Open Source Project
# This file is just an example and is distributed without any warranty
# Made with love

#!/bin/bash



 connector() {

# Establecer el proyecto por defecto
gcloud config set project $PROJECT_ID

# Habilitar la API necesaria para Serverless VPC Access
gcloud services enable vpcaccess.googleapis.com

# Pausa para asegurar que la API se habilite antes de continuar
sleep 5

# Crear una subred adicional con /28 para el conector VPC
gcloud compute networks subnets create $SUBNET_CONNECTOR_NAME \
  --project=$PROJECT_ID \
  --region=$REGION \
  --network=$VPC_NAME \
  --range=$SUBNET_CONNECTOR_RANGE

# Crear el conector VPC utilizando la subred con /28
gcloud compute networks vpc-access connectors create $VPC_CONNECTOR_NAME \
  --region $REGION \
  --subnet $SUBNET_CONNECTOR_NAME \
  --machine-type e2-micro \
  --min-instances 1 \
  --max-instances 5

 }