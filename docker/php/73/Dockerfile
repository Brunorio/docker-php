FROM php:7.3-fpm-alpine

WORKDIR /projects

RUN apk add --update icu-dev \
&& apk add libzip-dev postgresql-dev \
libpng-dev libjpeg-turbo-dev freetype-dev \
&& apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
&& docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-freetype-dir=/usr/include/ \
&& docker-php-ext-install zip intl pdo pdo_mysql bcmath gd pdo_pgsql mysqli pgsql \
&& docker-php-ext-enable zip intl pdo pdo_mysql bcmath gd pdo_pgsql mysqli pgsql

RUN pecl install xdebug-2.7.2 \
    && docker-php-ext-enable xdebug \
    && apk del pcre-dev ${PHPIZE_DEPS}

RUN curl -sS https://getcomposer.org/installer | php; \
mv composer.phar /usr/local/bin/composer;