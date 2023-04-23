#!/usr/bin/env bash

docker exec ark-ded bash -c 'arkmanager saveworld && arkmanager backup'
git commit -m "$(date '+%Y-%m-%d_%H.%M.%S')"

