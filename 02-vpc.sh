# Axmos Technologies 
# Axmos Back End Example is an Open Source Project
# This file is just an example and is distributed without any warranty
# Made with love

#!/bin/bash

vpc() {


# Establecer el proyecto por defecto
gcloud config set project $PROJECT_ID

# Habilitar las APIs necesarias para la VPC y la subred
gcloud services enable compute.googleapis.com

# Pausa para asegurar que las APIs se habiliten antes de continuar
sleep 5

# Crear la VPC
gcloud compute networks create $VPC_NAME \
  --project=$PROJECT_ID \
  --subnet-mode=custom

# Crear la subred
gcloud compute networks subnets create $SUBNET_NAME \
  --project=$PROJECT_ID \
  --region=$REGION \
  --network=$VPC_NAME \
  --range=$SUBNET_RANGE

# Crear regla de firewall para permitir SSH solo desde IAP
gcloud compute firewall-rules create $FW_RULE_NAME_SSH \
  --project=$PROJECT_ID \
  --network=$VPC_NAME \
  --allow tcp:22 \
  --source-ranges=$IAP_RANGE \
  --description="Permitir SSH desde IAP"

# Crear regla de firewall para permitir RDP solo desde IAP
gcloud compute firewall-rules create $FW_RULE_NAME_RDP \
  --project=$PROJECT_ID \
  --network=$VPC_NAME \
  --allow tcp:3389 \
  --source-ranges=$IAP_RANGE \
  --description="Permitir RDP desde IAP"

}