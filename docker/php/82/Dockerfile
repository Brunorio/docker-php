FROM php:8.2-fpm-alpine

WORKDIR /projects

RUN apk add --update icu-dev linux-headers \
&& apk add libzip-dev postgresql-dev \
libpng-dev libjpeg-turbo-dev freetype-dev \
&& apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
&& docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ \
&& docker-php-ext-install zip intl pdo pdo_mysql gd pdo_pgsql mysqli pgsql \
&& docker-php-ext-enable zip intl pdo pdo_mysql gd pdo_pgsql mysqli pgsql

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del pcre-dev ${PHPIZE_DEPS}

RUN curl -sS https://getcomposer.org/installer | php; \
mv composer.phar /usr/local/bin/composer;