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
php-soap && \

php5enmod mcrypt && \

rm -rf /var/lib/apt/lists/*
