FROM php:7.4-fpm-alpine

RUN apk add --update icu-dev \
&& apk add libzip-dev postgresql-dev \
libpng-dev jpeg-dev freetype-dev \
&& apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
&& docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ \
&& docker-php-ext-install zip intl pdo pdo_mysql gd pdo_pgsql mysqli pgsql \
&& docker-php-ext-enable zip intl pdo pdo_mysql gd pdo_pgsql mysqli pgsql \
&& apk del pcre-dev ${PHPIZE_DEPS}

RUN curl -sS https://getcomposer.org/installer | php; \
mv composer.phar /usr/local/bin/composer;