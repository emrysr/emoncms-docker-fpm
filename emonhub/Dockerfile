FROM python:3.8-slim
ARG EMONCMS_WEB_DIR
ARG EMONCMS_DIR
ARG EMONHUB_DIR
ARG REBOOT_HOST_TOGGLE

COPY connected.py /
COPY entrypoint.sh /

RUN apt-get update && apt-get install -y git python-serial python-configobj python-requests build-essential python3-rpi.gpio
RUN git clone https://github.com/openenergymonitor/emonhub.git ${EMONHUB_DIR} 
RUN git clone https://github.com/emoncms/config.git ${EMONCMS_WEB_DIR}/Modules/config
RUN pip install paho-mqtt rpi.gpio 
RUN echo "reboot" > /shutdown_request
ENTRYPOINT ["/entrypoint.sh"]
