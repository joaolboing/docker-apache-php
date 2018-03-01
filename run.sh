#!/bin/bash


RedisConfFile='/etc/php5/mods-available/redis.ini'
if [[ ! -z "$REDIS_URL" ]] ; then
  echo 'session.save_handler = redis' >> $RedisConfFile
  echo 'session.save_path = ${REDIS_URL}' >> $RedisConfFile
fi

PhpIniFile='/etc/php5/apache2/php.ini'
if [[ ! -z "$PHP_MEM_LIMIT" ]] ; then
	sed -i 's/^memory_limit = .*/memory_limit = '$PHP_MEM_LIMIT'/' $PhpIniFile
fi

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
