FROM node:14-alpine3.13 as builder

ENV BUILD_ENV=docker
ENV APP_HOME=/app

WORKDIR $APP_HOME

COPY . .

RUN yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN yarn build

RUN rm -rf node_modules && \
  NODE_ENV=production yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

FROM node:14-alpine3.13

ENV APP_HOME=/app

WORKDIR $APP_HOME

COPY --from=builder $APP_HOME  $APP_HOME

RUN ls
RUN ls /

ENV HOST=0.0.0.0
EXPOSE 3000

CMD [ "pwd" ]
CMD [ "ls", "/app" ]
CMD [ "yarn", "start" ]
