# Axmos Technologies 
# Axmos Back End Example is an Open Source Project
# This file is just an example and is distributed without any warranty
# Made with love

#!/bin/bash

#General Vars

#Nombre de startup solo en minusculas y con "-" en vez de espacios
export $STARTUP_NAME=""
export PROJECT_ID=""

gcloud config set project $PROJECT_ID;

export PROJECT_NUMBER=$(gcloud projects list \
--filter="$(gcloud config get-value project)" \
--format="value(PROJECT_NUMBER)")

export REGION="southamerica-west1"


#VPC Vars

export VPC_NAME="$STARTUP_NAME-vpc-01"
export SUBNET_NAME="$STARTUP_NAME-subnet-01"
export SUBNET_RANGE="10.1.1.0/24"
export FW_RULE_NAME_SSH="allow-ssh-from-iap"
export FW_RULE_NAME_RDP="allow-rdp-from-iap"
export IAP_RANGE="35.235.240.0/20"


# SQL Vars
export INSTANCE_NAME="$STARTUP_NAME-sql-instance"
export DB_TYPE="POSTGRES_14"  # Cambia a "MYSQL_8_0" o "SQLSERVER_2019_STANDARD" según sea necesario
export CPU_SIZE="2"
export MEMORY_SIZE="7680MB"
export ALLOCATED_IP_RANGE_NAME="$STARTUP_NAME-allocated-range"
export DB_PASS="1234"
export DB_PORT="1234"
export DB_NAME="1234"
export DB_HOST="$PROJECT_ID:$REGION:$INSTANCE_NAME"
export DB_USER="1234"


# VPC Connector
export SUBNET_CONNECTOR_NAME="$STARTUP_NAME-subnet-connector"
export SUBNET_CONNECTOR_RANGE="10.1.2.0/28"
export VPC_CONNECTOR_NAME="$STARTUP_NAME-vpc-connector"

# Bigquery
export DATASET_NAME="${STARTUP_NAME}_dataset"


source ./01-enable_apis.sh
source ./02-vpc.sh
source ./03-vpc_connector.sh
source ./04-artifact_registry.sh
source ./05-cloud_sql.sh
source ./06-secrets.sh
source ./07-bigquery.sh
source ./08-permisions.sh


#Run Config
apis;
vpc;
connector;
artifact;
sql;
secrets;
bigquery;
permisions;

