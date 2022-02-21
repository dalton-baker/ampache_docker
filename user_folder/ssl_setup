#!/bin/sh

#enable ssl mod
a2enmod ssl

#copy apache config file
cp /home/usr/ssl.conf /etc/apache2/sites-enabled/ssl.conf

#restart apache, for some reason the restart command doesn't work
service apache2 stop
service apache2 start