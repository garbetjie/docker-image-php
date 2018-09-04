#!/usr/bin/env sh
set -e

# Replace INI configuration
for src_file in `find $PHP_INI_DIR/php.ini $PHP_INI_DIR/conf.d`; do
	envsubst '$ERROR_REPORTING
	          $MEMORY_LIMIT
              $POST_MAX_SIZE
              $UPLOAD_MAX_FILESIZE
              $TIMEZONE
              $SESSION_SAVE_HANDLER
              $SESSION_SAVE_PATH
              $DISPLAY_ERRORS
              $HTML_ERRORS
              $MAX_EXECUTION_TIME
              $PHP_MAX_INPUT_TIME
              $NEWRELIC_LICENCE
              $NEWRELIC_APP_NAME
              $NEWRELIC_AUTORUM_ENABLED
              $NEWRELIC_LABELS
              $XDEBUG_ENABLED
              $XDEBUG_REMOTE_HOST
              $XDEBUG_REMOTE_PORT
              $XDEBUG_REMOTE_AUTOSTART
              $XDEBUG_IDE_KEY' < "$src_file" > "$src_file"
done
