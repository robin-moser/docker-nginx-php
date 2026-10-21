#!/bin/sh
set -e

export NGINX_SERVER_ROOT="${NGINX_SERVER_ROOT:-$NGINX_WEB_ROOT}"
mkdir -p "$NGINX_WEB_ROOT"
chmod 750 "$NGINX_WEB_ROOT"
chown www-data:www-data "$NGINX_WEB_ROOT"

exec docker-php-entrypoint "$@"
