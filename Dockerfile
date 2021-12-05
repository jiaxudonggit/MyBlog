FROM node:14-alpine3.13 as builder

WORKDIR /app

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

WORKDIR /app

RUN yarn global add pm2

COPY --from=builder /app  .

EXPOSE 9000

CMD ["pm2-runtime", "processes.json"]
