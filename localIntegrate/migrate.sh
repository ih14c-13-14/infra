#!/usr/bin/env bash

docker compose up -d db
docker compose run --rm app bash -c "yarn prisma migrate deploy && yarn prisma db push && yarn prisma db seed"
docker compose down
