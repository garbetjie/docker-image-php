[global]
error_log = /dev/stderr
log_level = error
daemonize = false

[app]
user = app
group = app
listen = 127.0.0.1:9000
pm = $FPM_PM
pm.max_children = $FPM_MAX_CHILDREN
pm.min_spare_servers = $FPM_MIN_SPARE_SERVERS
pm.max_spare_servers = $FPM_MAX_SPARE_SERVERS
pm.max_requests = $FPM_MAX_REQUESTS
pm.status_path = /_/status
ping.path = /_/ping
ping.response = pong
catch_workers_output = true
clear_env = false
security.limit_extensions = .php .phar
php_admin_flag[log_errors] = true
php_admin_value[error_log] = /dev/stderr