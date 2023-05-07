#!/usr/bin/env bash

chown -R 1000:1000 ARK-Backups
docker compose ps --format json | jq -r '.[].Name' | while read container; do
  docker exec "$container" bash -c 'arkmanager saveworld && arkmanager backup' &
done
wait
git add ARK-Backups
git commit -m "$(date '+%Y-%m-%d_%H.%M.%S')"
