FROM node:14.17.3

COPY . /app
WORKDIR /app

RUN yarn config set registry https://registry.npm.taobao.org/
RUN rm -rf ./node_modules
RUN yarn install --no-bin-links
RUN yarn run build

EXPOSE 9000

CMD BUILD_ENV=docker yarn run start
