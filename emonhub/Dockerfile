FROM python:3.8-slim
ARG EMONCMS_WEB_DIR
ARG EMONCMS_DIR
ARG EMONHUB_DIR

COPY ./connected.py /connected.py

RUN apt-get update && apt-get install -y git python-serial python-configobj python-requests build-essential python3-rpi.gpio \
    && git clone https://github.com/emrysr/emonhub.git ${EMONHUB_DIR} \
    && git clone https://github.com/emoncms/config.git ${EMONCMS_WEB_DIR}/Modules/config \
    && pip install paho-mqtt rpi.gpio \
    && sed -i -n '/dtoverlay=pi3-disable-bt/!p;$a dtoverlay=pi3-disable-bt' /boot/config
