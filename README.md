# Ampache Docker


## Container management

Open a terminal in a container: 
```
docker exec -it ampache bash
```

Start container with compose: 
```
docker-compose up -d
```

Kill container with compose: 
```
docker-compose down
```

Configure ssl
```
docker exec -i ampache sh /home/usr/ssl_setup.sh
```

Start container and Configure ssl
```
docker-compose up -d; docker exec -i ampache sh -c "a2enmod ssl service apache2 stop;service apache2 start;"
```


## Backup & Restore

Backup mySql database to a file:
```
mysqldump -u ampache -p -h localhost ampache > /home/usr/backup.sql
```

Restore mySql database from a file:
```
mysql -u ampache -p -h localhost ampache < /home/usr/backup.sql
```


Backup volume folders to tars: 
```
docker run --rm --volumes-from ampache -v /home/pi/ampache_docker/backups:/backup busybox sh /backup/scripts/backup_script.sh
```


Restore tar files from tars: 
```
docker run --rm --volumes-from ampache -v /home/pi/ampache_docker/backups:/backup busybox sh /backup/scripts/restore_script.sh {backup-filename}.tar
```
