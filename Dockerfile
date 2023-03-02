FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Define environment variables needed by onboardbase
ARG ONBOARDBASE_TOKEN=
ARG ONBOARDBASE_PROJECT=dockerized-nodejs-application
ARG ONBOARDBASE_ENVIRONMENT=development

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3600

# Install onboardbase cli
RUN npm i -g @onboardbase/cli

# Set onboardbase token config
RUN onboardbase config:set --token "$ONBOARDBASE_TOKEN" 

# Set command to run project with onboardbase
CMD onboardbase run "npm start"