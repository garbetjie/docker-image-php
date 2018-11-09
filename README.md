Docker Images for PHP
---------------------

![Build status](https://travis-ci.org/garbetjie/docker-image-php.svg?branch=master)

Docker images for PHP (both CLI and HTTP), designed to be as full-featured as possible, whilst being as simple as possible
to get up and running.


## Quick start

It's really simply to get a web server up & running:

```
# Start up a web server.
docker run --rm -v $(pwd):/app garbetjie/php:7.2

# Run a CLI application.
docker run --rm -v $(pwd):/app garbetjie/php:7.2 php -v

# Run a web server, and change the webroot.
docker run --rm -v $(pwd):/app -e WEBROOT=/app/public garbetjie/php:7.2 
```

Most settings can be changed through setting certain environment variables (see the "Configuration" section for available
settings), or through building your own image off of one of the `-onbuild` images.


## Available versions

Currently, there are only two versions of PHP available: **7.1** and **7.2**. As more versions become available, they
will be added.


## Customising your image.

More content coming soon.


## Configuration

The following values can be specified as environment variables to configure your container:

| Name                     | Type   | Default                           | Description                                                                                                                                                                                                                            |
|--------------------------|--------|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| UID                      | int    | 65534                             | The numeric user ID that the web server (or any CLI scripts) should run as.                                                                                                                                                            |
| GID                      | int    | 65534                             | The numeric group ID that the web server (or any CLI scripts) should run as.                                                                                                                                                           |
| WEBROOT                  | string | /app                              | The path to the public webroot of your project.                                                                                                                                                                                        |
| TIMEOUT                  | int    | 60                                | How long to allow scripts to run for. This is used by PHP-FPM and NGiNX to terminate PHP requests that exceed this duration.                                                                                                           |
| SSL_ENABLED              | bool   | true                              | Whether to enable SSL.                                                                                                                                                                                                                 |
| SSL_CERT_URL             | string | ""                                | The URL from which to download the SSL certificate. If an SSL certificate is already found at `/etc/nginx/ssl.crt`, then this is ignored.                                                                                              |
| SSL_KEY_URL              | string | ""                                | Similar to `$SSL_CERT_URL`, the URL from which to download the certificate key. Ignored if `/etc/nginx/ssl.key` exists.                                                                                                                |
| HSTS_ENABLED             | bool   | false                             | Enables HSTS.                                                                                                                                                                                                                          |
| HSTS_MAX_AGE             | int    | 0                                 | Sets the max age for HSTS.                                                                                                                                                                                                             |
| FPM_MAX_CHILDREN         | int    | 0                                 | Configures [`pm.max_children`](http://php.net/manual/en/install.fpm.configuration.php#pm.max-children). Defaults to 80% of available memory if left as `0`, assuming `$MEMORY_LIMIT` used per process (80% of memory / $MEMORY_LIMIT). |
| FPM_MAX_REQUESTS         | int    | 10000                             | Configures [`pm.max_requests`](http://php.net/manual/en/install.fpm.configuration.php#pm.max-requests).                                                                                                                                |
| FPM_MAX_SPARE_SERVERS    | int    | 15                                | Configures [`pm.max_spare_servers`](http://php.net/manual/en/install.fpm.configuration.php#pm.max-spare-servers).                                                                                                                      |
| FPM_MIN_SPARE_SERVERS    | int    | 5                                 | Configures [`pm.min_spare_servers`](http://php.net/manual/en/install.fpm.configuration.php#pm.min-spare-servers).                                                                                                                      |
| FPM_PM                   | string | static                            | Configures [`pm`](http://php.net/manual/en/install.fpm.configuration.php#pm).                                                                                                                                                          |
| TIMEZONE                 | string | Etc/UTC                           | Sets the default timezone for PHP.                                                                                                                                                                                                     |
| DISPLAY_ERRORS           | string | Off                               | Configures [`display_errors`](http://php.net/manual/en/errorfunc.configuration.php#ini.display-errors).                                                                                                                                |
| ERROR_REPORTING          | string | E_ALL & ~E_DEPRECATED & ~E_STRICT | Configures [`error_reporting`](http://php.net/manual/en/errorfunc.configuration.php#ini.error-reporting).                                                                                                                              |
| HTML_ERRORS              | bool   | Off                               | Configures [`html_errors`](http://php.net/manual/en/errorfunc.configuration.php#ini.html-errors).                                                                                                                                      |
| MAX_EXECUTION_TIME       | int    | 30                                | Configures [`max_execution_time`](http://php.net/manual/en/info.configuration.php#ini.max-execution-time).                                                                                                                             |
| MEMORY_LIMIT             | string | 64M                               | Configures [`memory_limit`](http://php.net/manual/en/ini.core.php#ini.memory-limit)                                                                                                                                                    |
| POST_MAX_SIZE            | string | 8M                                | Configures [`post_max_size`](http://php.net/manual/en/ini.core.php#ini.post-max-size)                                                                                                                                                  |
| SESSION_SAVE_HANDLER     | string | files                             | Configures [`session.save_handler`](http://php.net/manual/en/session.configuration.php#ini.session.save-handler)                                                                                                                       |
| SESSION_SAVE_PATH        | string | /tmp/sessions                     | Configures [`session.save_path`](http://php.net/manual/en/session.configuration.php#ini.session.save-path)                                                                                                                             |
| UPLOAD_MAX_FILESIZE      | string | 2M                                | Configures [`upload_max_filesize`](http://php.net/manual/en/ini.core.php#ini.upload-max-filesize)                                                                                                                                      |
| XDEBUG_IDE_KEY           | string | IDEKEY                            | Configures [`xdebug.idekey`](https://xdebug.org/docs/all_settings#idekey).                                                                                                                                                             |
| XDEBUG_REMOTE_AUTOSTART  | bool   | 0                                 | Configures [`xdebug.remote_autostart`](https://xdebug.org/docs/all_settings#remote_autostart)                                                                                                                                          |
| XDEBUG_REMOTE_HOST       | string | 192.168.99.1                      | Configures [`xdebug.remote_host`](https://xdebug.org/docs/all_settings#remote_host)                                                                                                                                                    |
| XDEBUG_REMOTE_PORT       | int    | 9000                              | Configures [`xdebug.remote_port`](https://xdebug.org/docs/all_settings#remote_port).                                                                                                                                                   |
| NEWRELIC_APP_NAME        | string | ""                                | If the New Relic extension is enabled, sets the name for the New Relic application. [See documentation](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-appname).                         |
| NEWRELIC_AUTORUM_ENABLED | bool   | false                             | Enables automatic insertion of New Relic Browser monitoring scripts. [See documentation](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-autorum).                                        |
| NEWRELIC_LABELS          | string | ""                                | Set label names and values for New Relic. [See documentation](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-labels).                                                                    |
| NEWRELIC_LICENCE         | string | ""                                | **Required** if New Relic is enabled. Sets the licence key of your New Relic account. [See documentation](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-license).                       |


### Build arguments

When creating your own image from one of the `-onbuild` images, the following build arguments can be used to customise
your image:

| Name             | Type | Default | Description                                                                                                                         |
|------------------|------|---------|-------------------------------------------------------------------------------------------------------------------------------------|
| NEWRELIC_ENABLED | bool | false   | Enables the installation of the New Relic extension. If this is `false`, then all `NEWRELIC_*` configuration variables are ignored. |
| XDEBUG_ENABLED   | bool | false   | Enables the installation of the XDebug extension. Anything that requires XDebug will not be available if this is `false`.           |



## Available modules

The following table shows which modules are available for each PHP version. Whilst every attempt is made to ensure that
each version has the same modules, it can't always be guaranteed.

If you want to find out the modules that your image has, simply run `docker run --rm garbetjie/php:$VERSION php -m` (
replacing `$VERSION` with the version you're wanting to view the list of modules for).

| 7.1          | 7.2          |
|--------------|--------------|
| amqp         | amqp         |
| apcu         | apcu         |
| bcmath       | bcmath       |
| bz2          | bz2          |
| ctype        | ctype        |
| curl         | curl         |
| date         | date         |
| dom          | dom          |
| exif         | exif         |
| fileinfo     | fileinfo     |
| filter       | filter       |
| ftp          | ftp          |
| gd           | gd           |
| gettext      | gettext      |
| gmp          | gmp          |
| hash         | hash         |
| iconv        | iconv        |
| intl         | intl         |
| json         | json         |
| libxml       | libxml       |
| mbstring     | mbstring     |
| memcached    | memcached    |
| mysqlnd      | mysqlnd      |
| newrelic     | newrelic     |
| openssl      | openssl      |
| pcre         | pcre         |
| pdo          | pdo          |
| pdo_mysql    | pdo_mysql    |
| pdo_sqlite   | pdo_sqlite   |
| phar         | phar         |
| readline     | readline     |
| redis        | redis        |
| reflection   | reflection   |
| session      | session      |
| SimpleXML    | SimpleXML    |
| soap         | soap         |
| sodium       | sodium       |
| sqlite3      | sqlite3      |
| standard     | standard     |
| tokenizer    | tokenizer    |
| xdebug       | xdebug       |
| xml          | xml          |
| xmlwriter    | xmlwriter    |
| Zend OPcache | Zend OPcache |
| zip          | zip          |
| zlib         | zlib         |
