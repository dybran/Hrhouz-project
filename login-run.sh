#!/bin/bash


ECR_URL=$1
INSTANCE_IP=$2


# Authenticate docker with ECR
aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin ${ECR_URL}
# Docker pull and run
docker pull ${ECR_URL}

# Parse server setup
# Run Mongo container
docker run --name parse-mongo-db -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password -p 27017:27017 -d mongo

# Run Parse server container
docker run --name parse-server -e PARSE_SERVER_APPLICATION_ID=hrhouz -e PARSE_SERVER_MASTER_KEY=master_key -e PARSE_SERVER_JAVASCRIPT_KEY=javascript_key -e PARSE_SERVER_ALLOW_ORIGIN=* -e PARSE_SERVER_DATABASE_URI=mongodb://admin:password@mongo/parse_server?authSource=admin --link parse-mongo-db:mongo -p 1337:1337 -d parseplatform/parse-server --masterKeyIps "0.0.0.0/0"

# Run Parse dashboard container
docker run --name parse-dashboard -e PARSE_DASHBOARD_APP_ID=hrhouz -e PARSE_DASHBOARD_MASTER_KEY=master_key -e PARSE_DASHBOARD_USER_ID=admin -e PARSE_DASHBOARD_USER_PASSWORD=password -e PARSE_DASHBOARD_ALLOW_INSECURE_HTTP=true -e PARSE_DASHBOARD_SERVER_URL=http://${INSTANCE_IP}:1337/parse --link parse-server:parse-server -p 4040:4040 -d parseplatform/parse-dashboard

echo "All containers started successfully!"
