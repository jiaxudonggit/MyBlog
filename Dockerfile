FROM node:14-alpine3.13 as build

ENV NODE_ENV=production
ENV BUILD_ENV=docker

RUN mkdir /var/www/app
COPY . /var/www/app
WORKDIR /var/www/app

RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn cache clean
RUN yarn global add pm2
RUN yarn install
RUN yarn build

EXPOSE 9000

# run docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
