#!/usr/bin/env sh
set -e

dirnames="/var/lib/nginx /tmp/sessions"

# Append New Relic log file if configuration provided.
nr_log_file="$(php -r 'echo ini_get("newrelic.daemon.logfile");')"
if [ "$nr_log_file" != "" ]; then
    dirnames="${dirnames} $(dirname ${nr_log_file})"
fi

nr_audit_file="$(php -r 'echo ini_get("newrelic.daemon.auditlog");')"
if [ "$nr_audit_file" != "" ]; then
    dirnames="${dirnames} $(dirname ${nr_audit_file})"
fi

# Chown necessary directories.
for dirname in $dirnames; do
    mkdir -p "$dirname"
    chown -RL app:app "$dirname"
done
