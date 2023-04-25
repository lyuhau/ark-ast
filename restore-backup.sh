#!/usr/bin/env bash

rm -rf ARK-Backups

datefolder="ARK-Backups/$(basename "$(dirname "$1")")"
mkdir -p "$datefolder"

cp -rf "$1" "$datefolder"

