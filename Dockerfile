FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt install apache2 libapache2-mod-php openssl php-imagick php-common php-curl php-gd php-imap php-intl php-json php-ldap php-mbstring php-mysql php-pgsql php-ssh2 php-sqlite3 php-xml php-zip -y
RUN apt install mariadb-server -y

RUN rm /var/www/html/index.html
COPY joomla/html /var/www/html
COPy dump.sql /tmp/dump.sql
ADD init_db.sh /tmp/init_db.sh
RUN /tmp/init_db.sh
COPY starterscripts/ /tmp/starterscripts/

RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/
COPY joomla.conf /etc/apache2/sites-available/
RUN a2ensite joomla.conf
RUN a2enmod rewrite
ENTRYPOINT ["bash","/tmp/starterscripts/apachestart.sh"]
EXPOSE 80
