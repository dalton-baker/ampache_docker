#!/usr/bin/env bash

backup_file="backup_"$(date +"%Y-%m-%d")".tar"

echo "******* Creating "$backup_file" *******"
docker run --rm --volumes-from ampache -v /home/pi/ampache_docker/backups:/backup busybox sh /backup/scripts/backup_script.sh

echo "   Cleaning up old backups"
i=0
for filename in $(ls /home/pi/ampache_docker/backups -r | grep '^backup.*\.tar$')
do
    i=$((i+1))

    if (( i > 10 )); then
        echo "      - removing "$filename
        rm "/home/pi/ampache_docker/backups/"$filename
    fi
done