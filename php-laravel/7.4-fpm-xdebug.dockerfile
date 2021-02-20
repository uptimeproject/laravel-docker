FROM uptimeproject/php-laravel:7.4-fpm

RUN apk add --no-cache --virtual .build-deps gcc make g++ zlib-dev autoconf && \
    pecl install xdebug && \
    apk del .build-deps && \
    rm -r /var/cache/* && \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

