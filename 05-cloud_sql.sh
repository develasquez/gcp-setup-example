# Axmos Technologies 
# Axmos Back End Example is an Open Source Project
# This file is just an example and is distributed without any warranty
# Made with love

#!/bin/bash


sql() {

# Establecer el proyecto por defecto
gcloud config set project $PROJECT_ID

# Habilitar las APIs necesarias para Cloud SQL
gcloud services enable sqladmin.googleapis.com servicenetworking.googleapis.com

# Pausa para asegurar que las APIs se habiliten antes de continuar
sleep 5

# Crear una IP de rango para la conexión privada de servicio
gcloud compute addresses create $ALLOCATED_IP_RANGE_NAME \
  --global \
  --prefix-length=24 \
  --description="Rango de IP para la conexión de servicio" \
  --network=$VPC_NAME \
  --purpose=VPC_PEERING

# Crear una conexión de servicio entre la red VPC y el servicio de Cloud SQL
gcloud services vpc-peerings connect \
  --service=servicenetworking.googleapis.com \
  --network=$VPC_NAME \
  --ranges=$ALLOCATED_IP_RANGE_NAME \
  --project=$PROJECT_ID

# Crear la instancia de Cloud SQL
gcloud sql instances create $INSTANCE_NAME \
  --database-version=$DB_TYPE \
  --cpu=$CPU_SIZE \
  --memory=$MEMORY_SIZE \
  --region=$REGION \
  --network="projects/$PROJECT_ID/global/networks/$VPC_NAME" \
  --no-assign-ip

# Configurar usuario y contraseña del Cloud SQL (este es solo un ejemplo, debes cambiar el usuario y la contraseña)
gcloud sql users set-password postgres \
  --instance=$INSTANCE_NAME \
  --password="$DB_PASSWORD"
}