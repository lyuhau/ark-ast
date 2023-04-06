#!/usr/bin/env bash

./build.sh

mkdir -p ARK-Backups
chown -R 1000:1000 ARK-Backups

docker-compose up -d
