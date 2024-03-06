# Use the parse-server image as the base image
FROM parseplatform/parse-server:latest

# Install parse-server-s3-adapter
USER root
RUN npm install parse-server-s3-adapter
RUN npm install aws-sdk

# Copy custom main.js file into the image
COPY ./app/data/main.js/* /parse-server/cloud/main.js
