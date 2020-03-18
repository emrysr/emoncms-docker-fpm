
FROM php:7.4-fpm

RUN apt-get update && apt-get install -y gettext libmosquitto-dev git-core

RUN docker-php-ext-install -j$(nproc) mysqli gettext

RUN pecl install redis \
  \ && docker-php-ext-enable redis
RUN pecl install Mosquitto-beta \
  \ && docker-php-ext-enable mosquitto
  
RUN mkdir /var/www/emoncms
RUN git clone https://github.com/emoncms/emoncms.git /var/www/emoncms
RUN git clone https://github.com/emoncms/dashboard.git /var/www/emoncms/Modules/dashboard
RUN git clone https://github.com/emoncms/graph.git /var/www/emoncms/Modules/graph
RUN git clone https://github.com/emoncms/app.git /var/www/emoncms/Modules/app

COPY docker.settings.ini /var/www/emoncms/settings.ini

# Create folders & set permissions for feed-engine data folders (mounted as docker volumes in docker-compose)
RUN mkdir /var/opt/emoncms
RUN mkdir /var/opt/emoncms/phpfina
RUN mkdir /var/opt/emoncms/phptimeseries

RUN chown -R www-data: /var/opt/emoncms/

# Create Emoncms logfile
RUN mkdir /var/log/emoncms
RUN touch /var/log/emoncms/emoncms.log
RUN chmod 666 /var/log/emoncms/emoncms.log
