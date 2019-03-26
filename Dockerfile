FROM ubuntu:17.10

RUN apt-get update 
RUN apt-get install apache2 mariadb-server mariadb-client php libapache2-mod-php php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-mysql php-cli php-mcrypt php-zip -y

RUN rm -rf /var/lib/apt/lists/*

ADD docktest /app
RUN chown -R www-data:www-data /app

ADD docktest.conf /etc/apache2/sites-available/laravel.conf
RUN a2ensite laravel.conf
RUN a2enmod rewrite

CMD ["/usr/sbin/apachectl","-DFOREGROUND"]

