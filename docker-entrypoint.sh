#!/bin/sh

# 启动服务
pm2 start processes.json

exec "$@"