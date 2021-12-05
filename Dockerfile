FROM node:14-alpine3.13 as build

ENV PORT=9000
ENV NODE_ENV=production
ENV BUILD_ENV=docker
ENV APP_HOME=/app

# Create app directory
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Installing dependencies
COPY package*.json $APP_HOME
RUN yarn

# Copying source files
COPY . $APP_HOME

# Building app
RUN yarn build

EXPOSE 9000

# start service
CMD ["yarn", "start"]
