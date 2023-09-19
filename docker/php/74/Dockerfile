FROM php:7.4-fpm-alpine

WORKDIR /projects

ENV LANG C.UTF-8

RUN echo "date.timezone = UTC" >> /usr/local/etc/php/php.ini
RUN echo "default_charset = UTF-8" >> /usr/local/etc/php/php.ini

RUN apk add --update icu-dev linux-headers \
&& apk add libzip-dev postgresql-dev tidyhtml-dev gmp-dev \
libpng-dev libjpeg-turbo-dev freetype-dev \
&& apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
&& docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ \
&& docker-php-ext-install zip intl gmp tidy pdo pdo_mysql bcmath gd pdo_pgsql mysqli pgsql \
&& docker-php-ext-enable zip intl pdo pdo_mysql bcmath gd gmp tidy pdo_pgsql mysqli pgsql

RUN pecl install xdebug-3.1.6 \
    && docker-php-ext-enable xdebug \
    && apk del pcre-dev ${PHPIZE_DEPS}

RUN curl -sS https://getcomposer.org/installer | php; \
mv composer.phar /usr/local/bin/composer;