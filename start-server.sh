#!/usr/bin/env bash

./build.sh

mkdir -p ARK-Backups cluster

docker-compose up -d $(<default-maps grep -v '#')

chown -R 1000:1000 ARK-Backups cluster
