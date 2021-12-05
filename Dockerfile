FROM node:14-alpine3.13 as build

ENV NODE_ENV=production
ENV BUILD_ENV=docker
ENV APP_HOME=/app

WORKDIR $APP_HOME

COPY ./package.json /package.json
COPY ./tsconfig.json /tsconfig.json
COPY ./processes.json /processes.json
COPY ./start.sh $APP_HOME/start.sh

RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn global add pm2 && yarn && yarn build

COPY . .
RUN chmod +x  $APP_HOME/start.sh

EXPOSE 9000

CMD ["pm2-runtime", "processes.json"]
