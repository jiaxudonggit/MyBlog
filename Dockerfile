FROM node:latest as build

RUN mkdir /app
ADD . /app

WORKDIR /app
RUN yarn config set registry https://registry.npm.taobao.org \
  && yarn \
  && yarn build

EXPOSE 9000

CMD BUILD_ENV=docker yarn start
