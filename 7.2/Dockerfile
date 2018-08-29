FROM alpine:3.8

WORKDIR /app

ENV NEWRELIC_VERSION="8.1.0.209" \
	PHP_VERSION="7.2.9-r1" \
	PHP_INI_DIR="/etc/php7"

# Provide build arguments for configuration.
ONBUILD ARG UID=65534

ONBUILD ARG NGINX_WEBROOT=/app
ONBUILD ARG NGINX_TIMEOUT=30

ONBUILD ARG FPM_MAX_CHILDREN=0
ONBUILD ARG FPM_MAX_REQUESTS=10000
ONBUILD ARG FPM_PM=static
ONBUILD ARG FPM_MIN_SPARE_SERVERS=5
ONBUILD ARG FPM_MAX_SPARE_SERVERS=15

ONBUILD ARG PHP_DATE_TIMEZONE="Etc/UTC"
ONBUILD ARG PHP_DISPLAY_ERRORS=Off
ONBUILD ARG PHP_ERROR_REPORTING="E_ALL & ~E_DEPRECATED & ~E_STRICT"
ONBUILD ARG PHP_HTML_ERRORS=Off
ONBUILD ARG PHP_MAX_EXECUTION_TIME=30
ONBUILD ARG PHP_MEMORY_LIMIT=32M
ONBUILD ARG PHP_POST_MAX_SIZE=8M
ONBUILD ARG PHP_SESSION_SAVE_HANDLER="files"
ONBUILD ARG PHP_SESSION_SAVE_PATH="/tmp/sessions"
ONBUILD ARG PHP_UPLOAD_MAX_FILESIZE=2M

ONBUILD ARG XDEBUG_ENABLED=false
ONBUILD ARG XDEBUG_IDE_KEY=IDEKEY
ONBUILD ARG XDEBUG_REMOTE_AUTOSTART=0
ONBUILD ARG XDEBUG_REMOTE_HOST=192.168.99.1
ONBUILD ARG XDEBUG_REMOTE_PORT=9000
ONBUILD ARG XDEBUG_SERVER_NAME="\$server_name"

ONBUILD ARG NEWRELIC_APP_NAME=""
ONBUILD ARG NEWRELIC_AUTORUM_ENABLED=0
ONBUILD ARG NEWRELIC_ENABLED=false
ONBUILD ARG NEWRELIC_LABELS=""
ONBUILD ARG NEWRELIC_LICENCE=""

# Set environment variables based on build arg values.
ONBUILD ENV \
	UID=${UID} \
	\
    NGINX_WEBROOT=${NGINX_WEBROOT} \
    NGINX_TIMEOUT=${NGINX_TIMEOUT} \
    \
	FPM_MAX_CHILDREN=${FPM_MAX_CHILDREN} \
    FPM_MAX_REQUESTS=${FPM_MAX_REQUESTS} \
    FPM_PM=${FPM_PM} \
    FPM_MIN_SPARE_SERVERS=${FPM_MIN_SPARE_SERVERS} \
    FPM_MAX_SPARE_SERVERS=${FPM_MAX_SPARE_SERVERS} \
    \
    PHP_DATE_TIMEZONE=${PHP_DATE_TIMEZONE} \
    PHP_DISPLAY_ERRORS=${PHP_DISPLAY_ERRORS} \
    PHP_ERROR_REPORTING=${PHP_ERROR_REPORTING} \
    PHP_HTML_ERRORS=${PHP_HTML_ERRORS} \
    PHP_MAX_EXECUTION_TIME=${PHP_MAX_EXECUTION_TIME} \
    PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT} \
    PHP_POST_MAX_SIZE=${PHP_POST_MAX_SIZE} \
    PHP_SESSION_SAVE_HANDLER=${PHP_SESSION_SAVE_HANDLER} \
    PHP_SESSION_SAVE_PATH=${PHP_SESSION_SAVE_PATH} \
    PHP_UPLOAD_MAX_FILESIZE=${PHP_UPLOAD_MAX_FILESIZE} \
    \
    XDEBUG_ENABLED=${XDEBUG_ENABLED} \
    XDEBUG_IDE_KEY=${XDEBUG_IDE_KEY} \
    XDEBUG_REMOTE_AUTOSTART=${XDEBUG_REMOTE_AUTOSTART} \
    XDEBUG_REMOTE_HOST=${XDEBUG_REMOTE_HOST} \
    XDEBUG_REMOTE_PORT=${XDEBUG_REMOTE_PORT} \
    XDEBUG_SERVER_NAME=${XDEBUG_SERVER_NAME} \
    \
    NEWRELIC_APP_NAME=${NEWRELIC_APP_NAME} \
    NEWRELIC_AUTORUM_ENABLED=${NEWRELIC_AUTORUM_ENABLED} \
    NEWRELIC_ENABLED=${NEWRELIC_ENABLED} \
    NEWRELIC_LABELS=${NEWRELIC_LABELS} \
    NEWRELIC_LICENCE=${NEWRELIC_LICENCE}

# Ensure required directories exist.
RUN set -e; \
	mkdir -p /opt /app; \
	exit 0; \
	apk add --no-cache ca-certificates; \
	wget https://php.codecasts.rocks/php-alpine.rsa.pub -O /etc/apk/keys/php-alpine.rsa.pub; \
	echo 'https://php.codecasts.rocks/v3.8/php-7.2' >> /etc/apk/repositories

# Install the PHP extensions already available in Alpine.
RUN set -e; \
	apk add --no-cache \
		php7 php7-amqp php7-apcu php7-bcmath php7-bz2 php7-ctype php7-curl \
		php7-dom php7-exif php7-fpm php7-ftp php7-gd php7-gettext php7-gmp \
		php7-iconv php7-intl php7-json php7-mbstring php7-mysqlnd php7-opcache \
		php7-openssl php7-pdo_mysql php7-pdo_sqlite php7-phar php7-soap php7-sodium \
		php7-sqlite3 php7-xdebug php7-xml php7-zip php7-zlib; \
	ln -s /usr/bin/php7 /usr/bin/php; \
	rm -rf /etc/nginx $PHP_INI_DIR; \
	mkdir -p /run/nginx

# Download, clean up and symlink New Relic extension. Only if it is enabled.
ONBUILD RUN set -e; \
	if [ "$NEWRELIC_ENABLED" != "true" ]; then exit 0; fi; \
	wget https://download.newrelic.com/php_agent/archive/${NEWRELIC_VERSION}/newrelic-php5-${NEWRELIC_VERSION}-linux-musl.tar.gz -O- | tar -xz -C /tmp; \
	mv /tmp/newrelic-php5-${NEWRELIC_VERSION}-linux-musl /opt/newrelic; \
	find /opt/newrelic/agent/x64 -type f ! -name "newrelic-$(php -i | grep -F 'PHP Extension =' | sed -e 's/PHP Extension => //').so" -delete; \
	ln -s "$(find /opt/newrelic/agent/x64 -iname '*.so' | head -n 1)" $(php -r 'echo ini_get("extension_dir");')/newrelic.so;