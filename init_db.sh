#!/bin/bash
/etc/init.d/mysql start
mysql -u root -e "create user 'joomla_user'@'localhost' identified by 'PASSWORD'"
mysql -u root -e "CREATE DATABASE joomla_db"
mysql -u root -e "GRANT ALL ON joomla_db.* TO 'joomla_user'@'localhost' IDENTIFIED BY 'StrongPassword'"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root joomla_db < /tmp/dump.sql
