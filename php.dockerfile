FROM php:7.4-fpm-alpine

RUN apk --update --no-cache add --virtual build-dependencies build-base openssl-dev autoconf libzip-dev curl-dev \
    && apk add \
    icu-dev \
    oniguruma-dev \
    tzdata

RUN rm -rf /tmp/pear

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/app

RUN chown laravel:laravel /var/www/app

WORKDIR /var/www/app

RUN docker-php-ext-install intl

RUN docker-php-ext-install pcntl

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install mbstring

RUN rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer