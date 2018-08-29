#!/usr/bin/env sh

# Initialize user if not root.
if [ $(id -u) != 0 ]; then
	deluser app &> /dev/null
	adduser -D -g '' -u ${UID} -h /app -s /sbin/nologin app
	chown -RL app:app /var/lib/nginx /var/log/newrelic
fi

# Execute any initialization scripts.
for script_path in /etc/cont-init.d/*; do
	sh ${script_path}
done

# If no arguments provided, then start up the web server.
if [ "$1" = "" ]; then
    php-fpm -t || exit 1
    nginx -t 2> /dev/null || exit 2

    echo -n "Starting web server... "
    php-fpm -F &
    nginx &
    echo "done"

    trap "kill 0" INT KILL STOP TERM CHLD

    wait
else
	exec su-exec app "$@"
fi