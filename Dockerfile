# ++++++++++++++++++++++++++++++++++++++
# Dockerfile: robinmoser/nginx-php
# ++++++++++++++++++++++++++++++++++++++

FROM robinmoser/nginx:latest
LABEL maintainer="Robin Moser"

ARG PHP_VERSION=81

# default ENV variables
ENV NGINX_INDEX="index.php"

RUN apk add --no-cache \
    libsodium \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-ctype \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-ftp \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-gmp \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-pecl-imagick \
    php${PHP_VERSION}-pecl-ssh2 \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-posix \
    php${PHP_VERSION}-session \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-sockets \
    php${PHP_VERSION}-sodium \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-zlib \
    && ln -s /usr/sbin/php-fpm${PHP_VERSION} /usr/local/bin/php-fpm

# remove unused configs
RUN rm -rf /etc/php${PHP_VERSION}/php-fpm.d

# create dirs
RUN mkdir -p /var/log/php

# copy S6 configs
COPY resources/services.d/ /etc/s6-overlay/s6-rc.d/
COPY resources/entrypoint.d/ /etc/cont-init.d

# copy configs
COPY config/nginx /etc/nginx
COPY config/php /etc/php${PHP_VERSION}

COPY index.php .
