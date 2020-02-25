
FROM php:7.4-fpm

RUN apt-get update && apt-get install -y gettext libmosquitto-dev

RUN docker-php-ext-install -j$(nproc) mysqli gettext

RUN pecl install redis \
  \ && docker-php-ext-enable redis
RUN pecl install Mosquitto-beta \
  \ && docker-php-ext-enable mosquitto
