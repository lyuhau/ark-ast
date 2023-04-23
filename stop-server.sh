#!/usr/bin/env bash

./backup-server.sh
docker exec ark-ded bash -c 'arkmanager stop'

