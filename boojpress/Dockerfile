FROM debian:jessie

MAINTAINER Booj Data "data@booj.com"

ENV WP_DB_USER="wpadmin"
ENV WP_DB_PASS="cleancut"
ENV WP_PREFIX="wp_"

EXPOSE 80

VOLUME '/var/www/wordpress/wp-content/uploads'

VOLUME '/var/log/apache2/'

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		wget \
		git \
		apache2 \
		libapache2-mod-php5 \ 
		php5-mysql \ 
		mysql-client \
		php5-gd \ 
		php-pear \ 
		php-apc \ 
		php5-curl  \ 
		curl \
		lynx-cur \
		libmysqlclient-dev \
		python \
		python-dev \
		python-mysqldb \
		python-pip \
			&& \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod php5
RUN a2enmod rewrite
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
ADD ./php.ini /etc/php5/apache2/php.ini
ADD ./setup.sh /var/www/setup.sh
WORKDIR /var/www/
RUN ./setup.sh
ADD wp-config.php /var/www/wordpress/wp-config.php
RUN rm ./setup.sh

CMD /usr/sbin/apache2ctl -D FOREGROUND
