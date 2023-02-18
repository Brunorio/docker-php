FROM php:7.4-fpm-alpine

COPY 90-xdebug.ini "${PHP_INI_DIR}/conf.d"

RUN apk add --update icu-dev \ 
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl \
&& docker-php-ext-install mysqli \
&& docker-php-ext-enable mysqli


RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
&& pecl install xdebug-3.1.0 \
&& docker-php-ext-enable xdebug \
&& apk del -f .build-deps