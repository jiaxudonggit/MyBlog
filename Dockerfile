FROM node:14-alpine3.13 as build

ENV NODE_ENV=production
ENV BUILD_ENV=docker
ENV APP_HOME=/app

RUN mkdir $APP_HOME
COPY . $APP_HOME
WORKDIR $APP_HOME

RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn global add pm2
RUN yarn build

EXPOSE 9000

# run docker-entrypoint.sh
CMD ["pm2", "start", "./processes.json"]
