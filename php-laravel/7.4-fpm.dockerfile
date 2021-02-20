FROM php:7.4-fpm-alpine

# System dependencies, PHP extensions & composer
RUN apk add --no-cache --virtual .build-deps libzip-dev icu-dev curl sqlite && \
    docker-php-ext-configure intl && \
    docker-php-ext-install pdo zip intl pdo_mysql && \
    curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    docker-php-source delete && \
    apk del .build-deps && \
    rm -r /var/cache/*
