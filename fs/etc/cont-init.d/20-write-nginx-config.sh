#!/usr/bin/env sh
set -e

cd /etc/nginx

# SSL is enabled, so download certificate and key files if provided, and the files
# don't already exist.
if [ "$SSL_ENABLED" = true ]; then
	if ! [ -f ssl.crt ] && [ "$SSL_CERT_DOWNLOAD_URL" ]; then
		echo -n "Downloading SSL certificate from '${SSL_CERT_DOWNLOAD_URL}'... "
		wget -O ssl.crt "$SSL_CERT_DOWNLOAD_URL" 2>/dev/null
		echo "done"
	fi

	if ! [ -f ssl.key ] && [ "$SSL_KEY_DOWNLOAD_URL" ]; then
		echo -n "Downloading SSL key from '${SSL_KEY_DOWNLOAD_URL}'... "
		wget -O ssl.key "$SSL_KEY_DOWNLOAD_URL" 2>/dev/null
		echo "done"
	fi

	mv conf-server.d/50-enable-ssl.conf-disabled conf-server.d/50-enable-ssl.conf 2>/dev/null || true

	if [ "$HSTS_ENABLED" = true ]; then
		mv conf-server.d/51-enable-hsts.conf-disabled conf-server.d/51-enable-hsts.conf 2>/dev/null || true
	else
		mv conf-server.d/51-enable-hsts.conf conf-server.d/51-enable-hsts.conf-disabled 2>/dev/null || true
	fi

	# Generate the DH param file if not already generated.
	if [ ! -f dhparam.pem ]; then
		echo -n "Generating DH param file... "
		openssl dhparam -out dhparam.pem 2048 2>/dev/null
		echo "done"
	fi

	# Generate the SSL ticket key.
	if [ ! -f ticket.key ]; then
		echo -n "Generating SSL ticket file... "
		openssl rand -out ticket.key 48 2>/dev/null
		echo "done"
	fi
else
	mv 51-enable-hsts.conf 51-enable-hsts.conf-disabled 2>/dev/null || true
	mv 50-enable-ssl.conf 50-enable-ssl.conf-disabled 2>/dev/null || true
fi

# Replace templated files.
for src_file in `find /etc/nginx -iname '*.tpl'`; do
    envsubst '$WEBROOT
              $TIMEOUT' < "$src_file" > "${src_file%.tpl}"
done
