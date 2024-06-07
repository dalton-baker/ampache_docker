#!/usr/bin/env bash

backup_folder=$1
backup_file="backup_"$(date +"%Y-%m-%d")".tar"
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
start=$SECONDS

echo "******* Creating "$backup_file" *******"
cp $script_dir/internal_backup_script.sh $backup_folder
docker run --rm --volumes-from ampache -v $backup_folder:/backup busybox sh /backup/internal_backup_script.sh
rm $backup_folder/internal_backup_script.sh

echo "   Cleaning up old backups"
i=0
for filename in $(ls $backup_folder -r | grep '^backup.*\.tar$')
do
    i=$((i+1))

    if (( i > 10 )); then
        echo "      - removing "$filename
        rm $backup_folder$filename
    fi
done

echo "   Finished backup after "$(( SECONDS - start ))" seconds"
echo