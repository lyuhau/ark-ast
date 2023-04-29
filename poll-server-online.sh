#!/usr/bin/env bash

echo -n "Waiting for server"
while [ "$(docker exec ark-ded bash -c "arkmanager status | perl -pe 's/\x1b\[[^\x1b]*m//g' | grep -oPie 'Server online:\s*\K\w+'" 2>/dev/null)" != "Yes" ]; do printf "."; sleep 10; done
printf " Server is up!\n"

