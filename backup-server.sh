#!/usr/bin/env bash

git stash -u
chown -R 1000:1000 ARK-Backups
docker exec ark-ded bash -c 'arkmanager saveworld && arkmanager backup'
git add ARK-Backups
git commit -m "$(date '+%Y-%m-%d_%H.%M.%S')"
git stash pop

