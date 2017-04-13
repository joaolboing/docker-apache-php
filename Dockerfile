FROM joaolboing/apache:14.04

MAINTAINER joaolboing <joaolboing@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y php5 \
libapache2-mod-php5 \
php5-fpm \
php5-cli \
php5-curl \
php5-gd \
php5-mcrypt \
php5-apcu \
php5-json \
php5-pgsql \
php5-mysql \
php-soap && \

php5enmod mcrypt && \

sed -i 's/^display_errors = .*/display_errors = On/' /etc/php5/apache2/php.ini && \
sed -i 's/^error_reporting = .*/error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_STRICT \& ~E_NOTICE/' /etc/php5/apache2/php.ini && \

rm -rf /var/lib/apt/lists/*
