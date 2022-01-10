FROM php:8.1-fpm-alpine

# System dependencies, PHP extensions & composer
RUN apk add --no-cache libzip-dev icu-dev curl sqlite libxml2-dev && \
    docker-php-ext-configure intl && \
    docker-php-ext-install pdo zip intl pdo_mysql soap && \
    curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    docker-php-source delete && \
    rm -r /var/cache/*
