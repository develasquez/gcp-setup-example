bigquery() {

bq --location=US mk -d \
    --default_table_expiration 3600 \
    --description "This is my dataset." \
    $DATASET_NAME

bq mk \
 -t \
 --expiration 3600 \
 --description "Test Login Table" \
 $DATASET.login-test \
 email:STRING,date:DATETIME,success:BOOLEAN

}