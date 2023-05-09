#!/usr/bin/env bash

check_status() {
  pids=()
  while read container; do
    status="$(docker exec $container bash -c "arkmanager status | perl -pe 's/\x1b\[[^\x1b]*m//g' | grep -oPie 'Server online:\s*\K\w+'" 2>/dev/null)"
    [ "$status" == "Yes" ] &
    pids+=("$!")
  done < <(docker compose ps --format json | jq -r '.[].Name')

  for pid in "${pids[@]}"; do
    if ! wait "$pid"; then
      return 1
    fi
  done
}

echo -n "Waiting for server..."
while ! check_status; do
  printf "."
  sleep 10
done
printf ' Server is up!\n'
