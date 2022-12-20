#!/bin/bash

. .env

./node_modules/.bin/postgraphile \
  --port $PORT \
  --subscriptions \
  --retry-on-init-fail \
  --watch \
  --enhance-graphiql \
  --dynamic-json \
  --no-setof-functions-contain-nulls \
  --no-ignore-rbac \
  --extended-errors errcode \
  --append-plugins @graphile-contrib/pg-simplify-inflector \
  --enable-query-batching \
  --disable-query-log \
  --legacy-relations omit \
  --connection $DATABASE_URL
