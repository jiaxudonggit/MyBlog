FROM node:lts as build

RUN mkdir /app
ADD . /app

WORKDIR /app
RUN yarn config set registry https://registry.npm.taobao.org \
  && yarn config set sass-binary-site http://npm.taobao.org/mirrors/node-sass \
  && yarn install \
  && yarn build

EXPOSE 9000

CMD BUILD_ENV=docker yarn start
