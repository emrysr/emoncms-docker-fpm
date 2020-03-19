FROM php:7.4-fpm

ARG EMONCMS_WEB_DIR
ARG PHPFINA_DIR
ARG PHPTIMESERIES_DIR
ARG EMONCMS_DATA_DIR
ARG LOG_LOCATION

RUN apt-get update && apt-get install -y gettext libmosquitto-dev git-core

RUN docker-php-ext-install -j$(nproc) mysqli gettext

RUN pecl install redis \
  \ && docker-php-ext-enable redis
RUN pecl install Mosquitto-beta \
  \ && docker-php-ext-enable mosquitto
  
RUN git clone https://github.com/emrysr/emoncms.git ${EMONCMS_WEB_DIR} \
    && git clone https://github.com/emoncms/dashboard.git ${EMONCMS_WEB_DIR}/Modules/dashboard \
    && git clone https://github.com/emoncms/graph.git ${EMONCMS_WEB_DIR}/Modules/graph \
    && git clone https://github.com/emoncms/app.git ${EMONCMS_WEB_DIR}/Modules/app

COPY ./docker.settings.ini ${EMONCMS_WEB_DIR}/settings.ini

# Create folders & set permissions for feed-engine data folders (mounted as docker volumes in docker-compose)
RUN mkdir -p ${PHPFINA_DIR}
RUN mkdir -p ${PHPTIMESERIES_DIR}

RUN chown -R www-data: ${EMONCMS_DATA_DIR}

# Create Emoncms logfile
RUN mkdir ${LOG_LOCATION}
RUN touch ${LOG_LOCATION}/emoncms.log
RUN chmod 666 ${LOG_LOCATION}/emoncms.log
