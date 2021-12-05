FROM node:14.18.1 as build

RUN mkdir /app
ADD . /app

WORKDIR /app
ENV NODE_ENV=production
RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn global add pm2
RUN yarn 
RUN yarn build

EXPOSE 9000

# run docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
