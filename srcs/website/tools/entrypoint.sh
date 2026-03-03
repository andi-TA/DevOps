#!/bin/sh

chown 101:101 /var/run/secrets/ssl_key /var/run/secrets/ssl_crt
chmod 400 /var/run/secrets/ssl_key /var/run/secrets/ssl_crt

chown 101:101 /var/run/secrets/ssl_key /var/run/secrets/ssl_key
chmod 400 /var/run/secrets/ssl_key /var/run/secrets/ssl_key

# On lance NGINX
exec "$@"