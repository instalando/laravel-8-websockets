FROM php:7.4-fpm-alpine

RUN apk --update --no-cache add --virtual \
    build-dependencies build-base openssl-dev autoconf libzip-dev curl-dev \
    wget \
    curl \
    # git \
    shadow \
    build-base \
    autoconf \
    # hiredis \
    libxml2-dev \
    zlib-dev \
    libevent \
    libevent-dev \
    openssl-dev \
    gmp-dev \
    icu-dev \
    && apk add \
    oniguruma-dev \
    tzdata

RUN docker-php-ext-install \
    pcntl \
    mbstring \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
    sockets \
    gmp \
    bcmath \
    intl

# Libevent
RUN pecl install event

RUN apk update

# Cleanup
# apk del .build-deps && \
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/app

RUN chown laravel:laravel /var/www/app

WORKDIR /var/www/app

EXPOSE 6001

CMD ["php", "artisan", "websockets:serve"]