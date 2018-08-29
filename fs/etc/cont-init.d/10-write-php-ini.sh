#!/usr/bin/env sh
set -e

# Enable/disable extensions.
[[ "$NEWRELIC_ENABLED" = true ]] && sed -i '/extension\s*=\s*newrelic.so/c\extension=newrelic.so'       $PHP_INI_DIR/conf.d/50-enable-extensions.ini
[[ "$XDEBUG_ENABLED" = true ]] &&   sed -i '/zend_extension\s*=\s*xdebug.so/c\zend_extension=xdebug.so' $PHP_INI_DIR/conf.d/50-enable-extensions.ini

# Replace INI configuration
envsubst '
$PHP_ERROR_REPORTING
$PHP_MEMORY_LIMIT
$PHP_POST_MAX_SIZE
$PHP_UPLOAD_MAX_FILESIZE
$PHP_DATE_TIMEZONE
$PHP_SESSION_SAVE_HANDLER
$PHP_SESSION_SAVE_PATH
$PHP_DISPLAY_ERRORS
$PHP_HTML_ERRORS
$PHP_MAX_EXECUTION_TIME
$PHP_MAX_INPUT_TIME
$NEWRELIC_LICENCE
$NEWRELIC_APP_NAME
$NEWRELIC_AUTORUM_ENABLED
$NEWRELIC_LABELS
$NEWRELIC_ENABLED
$XDEBUG_REMOTE_HOST
$XDEBUG_REMOTE_PORT
$XDEBUG_REMOTE_AUTOSTART
$XDEBUG_IDE_KEY' < $PHP_INI_DIR/php.ini.tpl > $PHP_INI_DIR/php.ini