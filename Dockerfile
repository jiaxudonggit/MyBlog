FROM node:12.14.1

COPY . /app
WORKDIR /app

RUN yarn install --registry https://registry.npm.taobao.org/
RUN yarn run build

EXPOSE 9000

CMD BUILD_ENV=docker yarn run start
