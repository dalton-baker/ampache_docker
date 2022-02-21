#!/bin/sh

#unpack single file backups
cd /backup
tar xvf backup.tar --strip 1

#unpack each single file backup in thier respective locations
cd /var/lib/mysql
tar xvf /backup/sql-backup.tar --strip 3

cd /etc/mysql
tar xvf /backup/sql-config-backup.tar --strip 2

cd /var/www/config
tar xvf /backup/config-backup.tar --strip 3

cd /var/log/ampache
tar xvf /backup/logs-backup.tar --strip 3

#removed unpacked single file backups
rm /backup/sql-backup.tar
rm /backup/sql-config-backup.tar
rm /backup/config-backup.tar
rm /backup/logs-backup.tar