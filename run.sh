#!/bin/bash


RedisConfFile='/etc/php5/mods-available/redis.ini'
if [[ ! -z "$REDIS_URL" ]] ; then
  echo 'session.save_handler = redis' >> $RedisConfFile
  echo 'session.save_path = ${REDIS_URL}' >> $RedisConfFile
fi

source /etc/apache2/envvars
exec apache2 -D FOREGROUND