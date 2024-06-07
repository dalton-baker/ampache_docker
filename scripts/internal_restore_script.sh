#!/bin/sh

echo "   Restoring Ampache from backup:"

echo "      - unpacking backups"
cd /backup
tar xf $1 --strip 1

echo "      - restoring sql database"
cd /var/lib/mysql
tar xf /backup/partial/sql-backup.tar --strip 3

echo "      - restoring sql config"
cd /etc/mysql
tar xf /backup/partial/sql-config-backup.tar --strip 2

echo "      - restoring Ampache config"
cd /var/www/config
tar xf /backup/partial/config-backup.tar --strip 3
chmod -R 777 /var/www/config

echo "      - restoring Ampache logs"
cd /var/log/ampache
tar xf /backup/partial/logs-backup.tar --strip 3

#removed unpacked single file backups
rm -r /backup/partial

echo "   Finished restoring Ampache"