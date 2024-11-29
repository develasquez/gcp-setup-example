# Axmos Technologies 
# Axmos Back End Example is an Open Source Project
# This file is just an example and is distributed without any warranty
# Made with love

#!/bin/bash

secrets() {
gcloud secrets create DB_NAME \
    --replication-policy="automatic"

echo -n "$DB_NAME" | \
    gcloud secrets versions add DB_NAME --data-file=-

gcloud secrets create DB_PASS \
    --replication-policy="automatic"

echo -n "$DB_PASS" | \
    gcloud secrets versions add DB_PASS --data-file=-

gcloud secrets create DB_HOST \
    --replication-policy="automatic"

echo -n "$DB_HOST" | \
    gcloud secrets versions add DB_HOST --data-file=-


gcloud secrets create DB_USER \
    --replication-policy="automatic"

echo -n "$DB_USER" | \
    gcloud secrets versions add DB_USER --data-file=-

echo -n "$AUTH_PLATFORM_KEY" | \
    gcloud secrets versions add AUTH_PLATFORM_KEY --data-file=-



echo -n "$AUTH_PLATFORM_DOMAIN" | \
    gcloud secrets versions add AUTH_PLATFORM_DOMAIN --data-file=-

}