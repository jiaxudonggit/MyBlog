FROM node:latest as build

RUN mkdir /app
ADD . /app

WORKDIR /app
RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn install -g pm2
RUN yarn 
RUN yarn build

EXPOSE 9000

# run docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
