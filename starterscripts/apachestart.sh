#!/bin.bash
/tmp/starterscripts/mysqlstart.sh
exec apachectl -D FOREGROUND
