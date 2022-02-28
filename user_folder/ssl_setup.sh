#!/bin/sh

#enable ssl mod
a2enmod ssl

#copy apache config file
#cp /home/usr/drdoomsalot-music.com.conf /etc/apache2/sites-enabled/drdoomsalot-music.com.conf
#cp /home/usr/drdoomsalot-music.com-le-ssl.conf /etc/apache2/sites-enabled/drdoomsalot-music.com-le-ssl.conf
#cp /home/usr/music.daltonsbaker.com.conf /etc/apache2/sites-enabled/music.daltonsbaker.com.conf
#cp /home/usr/music.daltonsbaker.com-le-ssl.conf /etc/apache2/sites-enabled/music.daltonsbaker.com-le-ssl.conf

#restart apache, for some reason the restart command doesn't work
service apache2 stop
service apache2 start