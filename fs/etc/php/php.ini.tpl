;; For more documentation on each item, visit https://php.net/{$ini_key}
;
;

[PHP]
;user_ini.filename = ".user.ini"
;user_ini.filename =
;user_ini.cache_ttl = 300

engine = On
short_open_tag = Off
precision = 14
output_buffering = 4096
;output_handler =
;url_rewriter.tags
;url_rewriter.hosts
zlib.output_compression = Off
;zlib.output_compression_level = -1
;zlib.output_handler =
implicit_flush = Off
unserialize_callback_func =
serialize_precision = -1
;open_basedir =
disable_functions =
disable_classes =
;highlight.string  = #DD0000
;highlight.comment = #FF9900
;highlight.keyword = #007700
;highlight.default = #0000BB
;highlight.html    = #000000
;ignore_user_abort = On
;realpath_cache_size = 4096k
;realpath_cache_ttl = 120
zend.enable_gc = On
;zend.multibyte = Off
;zend.script_encoding =

expose_php = On
max_execution_time = $PHP_MAX_EXECUTION_TIME
max_input_time = $PHP_MAX_INPUT_TIME
;max_input_nesting_level = 64
;max_input_vars = 1000
memory_limit = $PHP_MEMORY_LIMIT

error_reporting = $PHP_ERROR_REPORTING
display_errors = $PHP_DISPLAY_ERRORS
display_startup_errors = Off
log_errors = On
log_errors_max_len = 1024
ignore_repeated_errors = Off
ignore_repeated_source = Off
report_memleaks = On
track_errors = Off
;xmlrpc_errors = 0
;xmlrpc_error_number = 0
html_errors = $PHP_HTML_ERRORS
;docref_root = "/phpmanual/"
;docref_ext = .html
;error_prepend_string = "<span style='color: #ff0000'>"
;error_append_string = "</span>"
;error_log = syslog
;windows.show_crt_warning

;arg_separator.output = "&amp;"
;arg_separator.input = ";&"
variables_order = "GPCS"
request_order = "GP"
register_argc_argv = Off
auto_globals_jit = On
;enable_post_data_reading = Off
post_max_size = $PHP_POST_MAX_SIZE
auto_prepend_file =
auto_append_file =
default_mimetype = "text/html"
default_charset = "UTF-8"
;internal_encoding =
;input_encoding =
;output_encoding =

;include_path = ".:/php/includes"
doc_root =
user_dir =
;extension_dir = "./"
;sys_temp_dir = "/tmp"
enable_dl = Off
;cgi.force_redirect = 1
;cgi.nph = 1
;cgi.redirect_status_env =
;cgi.fix_pathinfo=1
;cgi.discard_path=1
;fastcgi.impersonate = 1
;fastcgi.logging = 0
;cgi.rfc2616_headers = 0
;cgi.check_shebang_line=1

file_uploads = On
;upload_tmp_dir =
upload_max_filesize = $PHP_UPLOAD_MAX_FILESIZE
max_file_uploads = 20

allow_url_fopen = On
allow_url_include = Off
;from="john@doe.com"
;user_agent="PHP"

default_socket_timeout = 30
auto_detect_line_endings = On

[CLI Server]
cli_server.color = On

[Date]
date.timezone = $PHP_DATE_TIMEZONE
;date.default_latitude = 31.7667
;date.default_longitude = 35.2333
;date.sunrise_zenith = 90.583333
;date.sunset_zenith = 90.583333

[filter]
;filter.default = unsafe_raw
;filter.default_flags =

[iconv]
;iconv.input_encoding =
;iconv.internal_encoding =
;iconv.output_encoding =

[intl]
;intl.default_locale =
;intl.error_level = E_WARNING
;intl.use_exceptions = 0

[sqlite3]
;sqlite3.extension_dir =

[Pcre]
;pcre.backtrack_limit=100000
;pcre.recursion_limit=100000
;pcre.jit=1

[Pdo]
;pdo_odbc.connection_pooling=strict
;pdo_odbc.db2_instance_name

[Pdo_mysql]
pdo_mysql.cache_size = 2000
pdo_mysql.default_socket=

[Phar]
;phar.readonly = On
;phar.require_hash = On
;phar.cache_list =

[mail function]
SMTP = localhost
smtp_port = 25
;sendmail_from = me@example.com
;sendmail_path =
;mail.force_extra_parameters =
mail.add_x_header = Off
;mail.log =
;mail.log = syslog

[SQL]
sql.safe_mode = Off

[ODBC]
;odbc.default_db    =  Not yet implemented
;odbc.default_user  =  Not yet implemented
;odbc.default_pw    =  Not yet implemented
;odbc.default_cursortype
odbc.allow_persistent = On
odbc.check_persistent = On
odbc.max_persistent = -1
odbc.max_links = -1
odbc.defaultlrl = 4096
odbc.defaultbinmode = 1
;birdstep.max_links = -1

[Interbase]
ibase.allow_persistent = 1
ibase.max_persistent = -1
ibase.max_links = -1
;ibase.default_db =
;ibase.default_user =
;ibase.default_password =
;ibase.default_charset =
ibase.timestampformat = "%Y-%m-%d %H:%M:%S"
ibase.dateformat = "%Y-%m-%d"
ibase.timeformat = "%H:%M:%S"

[MySQLi]
mysqli.max_persistent = -1
;mysqli.allow_local_infile = On
mysqli.allow_persistent = On
mysqli.max_links = -1
mysqli.cache_size = 2000
mysqli.default_port = 3306
mysqli.default_socket =
mysqli.default_host =
mysqli.default_user =
mysqli.default_pw =
mysqli.reconnect = Off

[mysqlnd]
mysqlnd.collect_statistics = On
mysqlnd.collect_memory_statistics = Off
;mysqlnd.debug =
;mysqlnd.log_mask = 0
;mysqlnd.mempool_default_size = 16000
;mysqlnd.net_cmd_buffer_size = 2048
;mysqlnd.net_read_buffer_size = 32768
;mysqlnd.net_read_timeout = 31536000
;mysqlnd.sha256_server_public_key =

[OCI8]
;oci8.privileged_connect = Off
;oci8.max_persistent = -1
;oci8.persistent_timeout = -1
;oci8.ping_interval = 60
;oci8.connection_class =
;oci8.events = Off
;oci8.statement_cache_size = 20
;oci8.default_prefetch = 100
;oci8.old_oci_close_semantics = Off

[PostgreSQL]
pgsql.allow_persistent = On
pgsql.auto_reset_persistent = Off
pgsql.max_persistent = -1
pgsql.max_links = -1
pgsql.ignore_notice = 0
pgsql.log_notice = 0

[bcmath]
bcmath.scale = 17

[browscap]
;browscap = extra/browscap.ini

[Session]
session.save_handler = files
session.save_path = "$PHP_SESSION_SAVE_PATH"
session.use_strict_mode = 0
session.use_cookies = 1
;session.cookie_secure =
session.use_only_cookies = 1
session.name = session
session.auto_start = 0
session.cookie_lifetime = 0
session.cookie_path = /
session.cookie_domain =
session.cookie_httponly =
session.serialize_handler = php
session.gc_probability = 1
session.gc_divisor = 1000
session.gc_maxlifetime = 7200
session.referer_check =
session.cache_limiter = nocache
session.cache_expire = 120
session.use_trans_sid = 0
session.sid_length = 64
session.trans_sid_tags = "a=href,area=href,frame=src,form="
;session.trans_sid_hosts=""
session.sid_bits_per_character = 5
;session.upload_progress.enabled = On
;session.upload_progress.cleanup = On
;session.upload_progress.prefix = "upload_progress_"
;session.upload_progress.name = "PHP_SESSION_UPLOAD_PROGRESS"
;session.upload_progress.freq =  "1%"
;session.upload_progress.min_freq = "1"
;session.lazy_write = On

[Assertion]
zend.assertions = -1
;assert.active = On
;assert.exception = On
;assert.warning = On
;assert.bail = Off
;assert.callback = 0
;assert.quiet_eval = 0

[COM]
;com.typelib_file =
;com.allow_dcom = true
;com.autoregister_typelib = true
;com.autoregister_casesensitive = false
;com.autoregister_verbose = true
;com.code_page=

[mbstring]
mbstring.language = English
;mbstring.internal_encoding = ; deprecated from 5.6.0
;mbstring.http_input = ; deprecated from 5.6.0
;mbstring.http_output = ; deprecated from 5.6.0
;mbstring.encoding_translation = Off
;mbstring.detect_order = auto
;mbstring.substitute_character = none
;mbstring.func_overload = 0 ; deprecated from 7.2.0
;mbstring.strict_detection = Off
;mbstring.http_output_conv_mimetype=^(text/|application/xhtml\+xml)

[gd]
;gd.jpeg_ignore_warning = 1

[exif]
;exif.encode_unicode = ISO-8859-15
;exif.decode_unicode_motorola = UCS-2BE
;exif.decode_unicode_intel    = UCS-2LE
;exif.encode_jis =
;exif.decode_jis_motorola = JIS
;exif.decode_jis_intel    = JIS

[Tidy]
;tidy.default_config = /usr/local/lib/php/default.tcfg
tidy.clean_output = Off

[soap]
soap.wsdl_cache_enabled=1
soap.wsdl_cache_dir="/tmp"
soap.wsdl_cache_ttl=86400
soap.wsdl_cache_limit = 5

[sysvshm]
;sysvshm.init_mem = 10000

[ldap]
ldap.max_links = -1

[mcrypt] ; deprecated from 7.1.0, separate module from 7.2.0
;mcrypt.algorithms_dir=
;mcrypt.modes_dir=

[dba]
;dba.default_handler=

[opcache]
;opcache.enable=1
;opcache.enable_cli=0
;opcache.memory_consumption=128
;opcache.interned_strings_buffer=8
;opcache.max_accelerated_files=50000
;opcache.max_wasted_percentage=5
;opcache.use_cwd=1
;opcache.validate_timestamps=1
;opcache.revalidate_freq=2
;opcache.revalidate_path=0
;opcache.save_comments=1
;opcache.fast_shutdown=0
;opcache.enable_file_override=0
;opcache.optimization_level=0xffffffff
;opcache.inherited_hack=1
;opcache.dups_fix=0
;opcache.blacklist_filename=
;opcache.max_file_size=0
;opcache.consistency_checks=0
;opcache.force_restart_timeout=180
;opcache.error_log=
;opcache.log_verbosity_level=1
;opcache.preferred_memory_model=
;opcache.protect_memory=0
;opcache.restrict_api=
;opcache.mmap_base=
;opcache.file_cache=
;opcache.file_cache_only=0
;opcache.file_cache_consistency_checks=1
;opcache.file_cache_fallback=1
;opcache.huge_code_pages=1
;opcache.validate_permission=0
;opcache.validate_root=0

[curl]
;curl.cainfo =

[openssl]
;openssl.cafile=
;openssl.capath=

[newrelic]
newrelic.enabled = $NEWRELIC_ENABLED
newrelic.license = "$NEWRELIC_LICENCE"
newrelic.appname = "$NEWRELIC_APP_NAME"
newrelic.logfile = "/var/log/newrelic/apm.log"
newrelic.loglevel = "warning"
newrelic.high_security = false              ; https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-high-security
newrelic.process_host.display_name = ""     ; https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-process_host-display_name

; Daemon configuration.
; https://docs.newrelic.com/docs/agents/php-agent/configuration/proxy-daemon-newreliccfg-settings

newrelic.daemon.logfile = "/var/log/newrelic/daemon.log"
newrelic.daemon.loglevel = "warning"
newrelic.daemon.port = "/tmp/.newrelic.sock"
newrelic.daemon.ssl = true
newrelic.daemon.ssl_ca_bundle = ""
newrelic.daemon.ssl_ca_path = ""
newrelic.daemon.proxy = ""
newrelic.daemon.pidfile = ""
newrelic.daemon.location = "/opt/newrelic/daemon/newrelic-daemon.x64"
newrelic.daemon.collector_host = "collector.newrelic.com"
newrelic.daemon.dont_launch = 0
newrelic.daemon.utilization.detect_aws = false
newrelic.daemon.utilization.detect_docker = false
newrelic.daemon.app_timeout = 10m
newrelic.daemon.auditlog = "/var/log/newrelic/audit.log"

; Error collection

newrelic.error_collector.enabled = true
newrelic.error_collector.ignore_user_exception_handler = false
newrelic.error_collector.ignore_exceptions = ""
newrelic.error_collector.ignore_errors = "" ; https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-err-ignore-errors
newrelic.error_collector.record_database_errors = true
newrelic.error_collector.prioritize_api_errors = false

; Browser monitoring

newrelic.browser_monitoring.auto_instrument = $NEWRELIC_AUTORUM_ENABLED ; https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-autorum
newrelic.transaction_tracer.enabled = true
newrelic.transaction_tracer.threshold = "apdex_f" ; https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-threshold
newrelic.transaction_tracer.detail = 1
newrelic.transaction_tracer.slow_sql = true
newrelic.transaction_tracer.stack_trace_threshold = 500ms
newrelic.transaction_tracer.explain_enabled = true
newrelic.transaction_tracer.explain_threshold = 500ms
newrelic.transaction_tracer.record_sql = ""
newrelic.transaction_tracer.custom = ""
newrelic.transaction_events.enabled = true

newrelic.framework = ""
newrelic.webtransaction.name.remove_trailing_path = false
newrelic.webtransaction.name.functions = ""
newrelic.webtransaction.name.files = ""

; Attribute collection
; https://docs.newrelic.com/docs/agents/manage-apm-agents/agent-metrics/agent-attributes

newrelic.attributes.enabled = true
newrelic.attributes.include = ""
newrelic.attributes.exclude = ""
newrelic.transaction_events.attributes.enabled = true
newrelic.transaction_events.attributes.include = ""
newrelic.transaction_events.attributes.exclude = ""
newrelic.transaction_tracer.attributes.enabled = true
newrelic.transaction_tracer.attributes.include = ""
newrelic.transaction_tracer.attributes.exclude = ""
newrelic.error_collector.attributes.enabled = true
newrelic.error_collector.attributes.include = ""
newrelic.error_collector.attributes.exclude = ""
newrelic.browser_monitoring.attributes.enabled = false
newrelic.browser_monitoring.attributes.include = ""
newrelic.browser_monitoring.attributes.exclude = ""

newrelic.feature_flag = ""
newrelic.custom_insights_events.enabled = true
newrelic.labels = "$NEWRELIC_LABELS"
newrelic.synthetics.enabled = true
newrelic.cross_application_tracer.enabled = true
newrelic.transaction_tracer.gather_input_queries = true
newrelic.error_collector.capture_events = true
newrelic.guzzle.enabled = true
newrelic.phpunit_events.enabled = false
newrelic.datastore_tracer.instance_reporting.enabled = true
newrelic.datastore_tracer.database_name_reporting.enabled = true

[xdebug]
xdebug.cli_color = 1
xdebug.dump.GET = *
xdebug.dump.POST = *
xdebug.dump.SERVER = *
xdebug.dump.COOKIE = *
xdebug.scream = 0
xdebug.var_display_max_children = 512
xdebug.var_display_max_data = 1024
xdebug.var_display_max_depth = 8
xdebug.idekey = ""
xdebug.remote_enable = 1
xdebug.remote_port = $XDEBUG_REMOTE_PORT
xdebug.remote_host = $XDEBUG_REMOTE_HOST
xdebug.remote_autostart = $XDEBUG_REMOTE_AUTOSTART