FROM node:14-alpine3.13 as build

ENV NODE_ENV=production
ENV BUILD_ENV=docker
ENV APP_HOME=/usr/src/app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY package*.json ./

RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn global add pm2
RUN yarn build

COPY ./docker-entrypoint.sh .
COPY ./processes.json .
COPY . $APP_HOME

# 可执行权限
RUN chmod +x  $APP_HOME/docker-entrypoint.sh

EXPOSE 9000

CMD yarn run start
