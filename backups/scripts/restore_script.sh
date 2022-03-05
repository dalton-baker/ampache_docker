#!/bin/sh

echo "   Restoring Ampache from backup:"

echo "      - unpacking backups"
cd /backup
tar xf $1 --strip 1

echo "      - restoring sql database"
cd /var/lib/mysql
tar xf /backup/sql-backup.tar --strip 3

echo "      - restoring sql config"
cd /etc/mysql
tar xf /backup/sql-config-backup.tar --strip 2

echo "      - restoring Ampache config"
cd /var/www/config
tar xf /backup/config-backup.tar --strip 3

echo "      - restoring Ampache logs"
cd /var/log/ampache
tar xf /backup/logs-backup.tar --strip 3

#removed unpacked single file backups
rm /backup/sql-backup.tar
rm /backup/sql-config-backup.tar
rm /backup/config-backup.tar
rm /backup/logs-backup.tar


echo "   Finished restoring Ampache"