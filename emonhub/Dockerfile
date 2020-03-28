FROM python:3.8-slim
ARG EMONCMS_WEB_DIR
ARG EMONCMS_DIR
ARG EMONHUB_DIR
ARG REBOOT_HOST_TOGGLE
ARG EMONHUB_LOG

COPY connected.py /
COPY entrypoint.sh /
RUN if [ ! -z "$EMONHUB_LOG" ] && [ ! -a $EMONHUB_LOG ]; then; LOG_DIR=`dirname $EMONHUB_LOG`; mkidr $LOG_DIR -p;   touch $EMONHUB_LOG; fi 
RUN apt-get update && apt-get install -y git python-serial python-configobj python-requests build-essential python3-rpi.gpio python-pip

#RUN git clone https://github.com/openenergymonitor/emonhub.git ${EMONHUB_DIR} 
RUN git clone https://github.com/emrysr/emonhub.git ${EMONHUB_DIR} 
#RUN git clone https://github.com/emoncms/config.git ${EMONCMS_WEB_DIR}/Modules/config
RUN git clone https://github.com/emrysr/config.git ${EMONCMS_WEB_DIR}/Modules/config
RUN pip install rpi.gpio configobj pyserial
RUN pip2 install paho-mqtt
RUN echo "reboot" > /shutdown_request
ENTRYPOINT ["/entrypoint.sh"]
