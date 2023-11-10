FROM ubuntu:jammy
RUN apt update
RUN export DEBIAN_FRONTEND=noninteractive; apt install apache2 mysql-server software-properties-common -y; add-apt-repository ppa:ondrej/php -y; add-apt-repository ppa:ondrej/apache2 -y; apt update; apt install php7.4 libapache2-mod-php7.4 php7.4-mysql -y
COPY ./html /var/www/html
RUN cp /var/www/html/upload/include/ost-sampleconfig.php /var/www/html/upload/include/ost-config.php;
RUN chown -R root:www-data /var/www/html; find /var/www/html -type f -exec chmod 664 {} \;
COPY alter_user.sql /tmp/alter_user.sql
COPY ostdb_init.sql /tmp/ostdb_init.sql
RUN service mysql start; mysql < /tmp/alter_user.sql; mysql_secure_installation -p'MeetTheRequirements!9' -D; mysql -p'MeetTheRequirements!9' < /tmp/ostdb_init.sql
COPY service_init.sh /service_init.sh
RUN chmod 700 /service_init.sh
EXPOSE 80 3306
CMD /service_init.sh