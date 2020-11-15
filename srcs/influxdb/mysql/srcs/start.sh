#!/bin/sh

#install MariaDB database (mariadb-install-db is a symlink to mysql_install_db)
#mysqld is MySQL server daemon program wich runs quietly in background
#Invoking "mysqld" will start the MySQL server. Terminating "mysqld" will shutdown the MySQL server
#create wordpress database (-e, --execute=name; Execute command and quit)
#import previously backed up database to MariaDB database server (wordpress < /wordpress.sql)
#create new user (root) with password (toor) and give permissions
mariadb-install-db -u root
mysqld -u root & sleep 5
mysql -u root -e 'CREATE DATABASE wordpress;'
mysql -u root wordpress < /wordpress.sql
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY 'toor';GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;USE wordpress;FLUSH PRIVILEGES;"

#start telegraf and sleep infinity for avoid container to stop
telegraf & sleep infinity
