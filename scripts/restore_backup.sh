#!/usr/bin/env bash
backup_folder=$1
backup_file=$2
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
start=$SECONDS

echo "******* Restoring backup "$backup_file" *******"
cp $script_dir/internal_restore_script.sh $backup_folder
docker run --rm --volumes-from ampache -v $backup_folder:/backup busybox sh /backup/internal_restore_script.sh $backup_file
rm $backup_folder/internal_restore_script.sh
echo "   Finished restore after "$(( SECONDS - start ))" seconds"
echo