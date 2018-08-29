#!/bin/sh

# Replace templated files.
for src_file in `find /etc/nginx -iname '*.tpl'`; do
    envsubst '$NGINX_WEBROOT' < "$src_file" > "${src_file%.tpl}"
done