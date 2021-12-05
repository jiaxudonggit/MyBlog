FROM node:14-alpine3.13 as build

ENV NODE_ENV=production
ENV BUILD_ENV=docker

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn global add pm2
RUN yarn build

COPY ./docker-entrypoint.sh .
# 可执行权限
RUN chmod +x ./docker-entrypoint.sh

EXPOSE 9000

# run docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
