worker_processes auto;
error_log /dev/stderr error;
daemon off;
pcre_jit on;
pid /run/nginx.pid;
user nobody;

events {
    worker_connections 2048;
    multi_accept on;
}

http {
    sendfile off;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 620; # See https://cloud.google.com/load-balancing/docs/https/#timeouts_and_retries for justification.
    types_hash_max_size 2048;
    server_tokens off;
    server_names_hash_bucket_size 128;
    client_max_body_size 5m;
    merge_slashes off;

    include mime.types;
    default_type text/plain;

    gzip on;
    gzip_disable "msie6";

    # Disable far-expires headers by default.
    map $sent_http_content_type $expires {
        default off;
    }

    include conf.d/*.conf;

    server {
        listen 80 deferred default_server;
        root $WEBROOT;
        expires $expires;
        charset utf8;
        try_files $uri $uri/ =404;
        index index.html index.php;

        access_log /dev/stdout;
        error_log /dev/stderr warn;
        error_page 404 403 401 400 500 502 503 504 @error;

        add_header X-XSS-Protection 1;
        add_header X-Frame-Options SAMEORIGIN;

        # Include configuration before location blocks.
        include conf-server.d/*.conf;

        location / {
            try_files $uri $uri/index.html /index.php?$args;
        }

        location ~ ^/_/(status|ping) {
            fastcgi_pass unix:/run/php-fpm.sock;
            include      fastcgi.conf;
        }

        location ~ \.php$ {
            # regex to split $uri to $fastcgi_script_name and $fastcgi_path
            fastcgi_split_path_info ^(.+\.php)(/.+)$;

            if (!-f $document_root$fastcgi_script_name) {
                return 404;
            }

            fastcgi_index index.php;
            fastcgi_pass  unix:/run/php-fpm.sock;
            include       fastcgi.conf;

            proxy_read_timeout $TIMEOUT;
        }

        location ~ /\. {
            deny all;
        }

        location /favicon.ico {
            try_files $uri =404;
        }

        location @error {
            internal;
            add_header Content-Type "text/plain" always;

            return 500 "$status: $status_msg";
        }
    }
}
