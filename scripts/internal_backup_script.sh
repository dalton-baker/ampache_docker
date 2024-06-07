#!/bin/sh

echo "   Starting Ampache backup:"
mkdir /backup/partial
echo "      - backing up sql database"
tar_output=$(tar cf /backup/partial/sql-backup.tar /var/lib/mysql 2>&1)
echo $tar_output | while read line ; do
   echo "         "$line
done

echo "      - backing up sql config"
tar_output=$(tar cf /backup/partial/sql-config-backup.tar /etc/mysql 2>&1)
echo $tar_output | while read line ; do
   echo "         "$line
done

echo "      - backing up Ampache config"
tar_output=$(tar cf /backup/partial/config-backup.tar /var/www/config 2>&1)
echo $tar_output | while read line ; do
   echo "         "$line
done

echo "      - backing up Ampache logs"
tar_output=$(tar cf /backup/partial/logs-backup.tar /var/log/ampache 2>&1)
echo $tar_output | while read line ; do
   echo "         "$line
done

echo "      - packing backups into single file"
tar_output=$(tar cf /backup/backup_"$(date +"%Y-%m-%d")".tar /backup/partial 2>&1)
echo $tar_output | while read line ; do
   echo "         "$line
done

rm -r backup/partial

echo "   Finished backing up Ampache"