#!/bin/sh

#create backups of all volumes
tar cvf /backup/sql-backup.tar /var/lib/mysql
tar cvf /backup/sql-config-backup.tar /etc/mysql
tar cvf /backup/config-backup.tar /var/www/config
tar cvf /backup/logs-backup.tar /var/log/ampache

#pack all backups into single file
tar acf /backup/backup.tar /backup/sql-backup.tar /backup/sql-config-backup.tar /backup/config-backup.tar /backup/logs-backup.tar

#remove single file backups
rm /backup/sql-backup.tar
rm /backup/sql-config-backup.tar
rm /backup/config-backup.tar
rm /backup/logs-backup.tar