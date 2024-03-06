# Use the parse-server image as the base image
FROM parseplatform/parse-server:latest

# # Install parse-server-s3-adapter
# USER root
# RUN npm install parse-server-s3-adapter
# RUN npm install aws-sdk

# # # Copy custom main.js file into the image
# COPY ./app/data/main.js /parse-server/cloud/

RUN mkdir parse

ADD ./parse-code/* /parse
WORKDIR /parse
RUN npm install

ENV APP_ID hrhouz
ENV MASTER_KEY Master_Key
ENV DATABASE_URI mongodb://localhost:27017/dev

# Optional (default : 'parse/cloud/main.js')
# ENV CLOUD_CODE_MAIN cloudCodePath

# Optional (default : '/parse')
# ENV PARSE_MOUNT mountPath

EXPOSE 1337

# Uncomment if you want to access cloud code outside of your container
# A main.js file must be present, if not Parse will not start

# VOLUME /parse/cloud               

CMD [ "npm", "start" ]
