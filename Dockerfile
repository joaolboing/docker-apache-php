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
php5-redis \
php-soap && \
php5enmod mcrypt && \
rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^display_errors = .*/display_errors = On/' /etc/php5/apache2/php.ini && \
sed -i 's/^error_reporting = .*/error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_STRICT \& ~E_NOTICE/' /etc/php5/apache2/php.ini && \
sed -i 's/^session.gc_maxlifetime = .*/session.gc_maxlifetime = 86400' /etc/php5/apache2/php.ini

#RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stdout /var/log/apache2/error.log

COPY ./run.sh /run.sh
RUN chmod +x /run.sh
CMD [ "/run.sh" ]