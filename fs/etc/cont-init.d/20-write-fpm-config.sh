#!/usr/bin/env sh
set -e

# If mo max children is defined, then calculate the max number of children allowed as 80% of available RAM, assuming
# ${PHP_MEMORY_LIMIT}MB per process.
[[ $FPM_MAX_CHILDREN -lt 1 ]] && export FPM_MAX_CHILDREN=`expr "$(grep MemTotal /proc/meminfo | awk '{print $2}')" "*" 80 "/" 100 "/" 1024 "/" $(echo "$PHP_MEMORY_LIMIT" | grep -oE '[0-9]+')`

# Update php-fpm.conf
envsubst '
$FPM_PM
$FPM_MAX_CHILDREN
$FPM_MIN_SPARE_SERVERS
$FPM_MAX_SPARE_SERVERS
$FPM_MAX_REQUESTS' < $PHP_INI_DIR/php-fpm.conf.tpl > $PHP_INI_DIR/php-fpm.conf