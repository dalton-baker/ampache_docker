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
docker exec -i ampache sh /home/usr/ssl_setup
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
docker run --rm --volumes-from ampache -v /home/pi/ampache_docker/volume_backup:/backup busybox sh /backup/backup_script
```


Restore tar files from tars: 
```
docker run --rm --volumes-from ampache -v /home/pi/ampache_docker/volume_backup:/backup busybox sh /backup/restore_script
```
