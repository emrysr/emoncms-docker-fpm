FROM python:3.8-slim
RUN apt-get update && apt-get install --no-install-recommends -y git-core
RUN git clone https://github.com/openenergymonitor/emonhub.git ${EMONHUB_DIR}
RUN git clone https://github.com/emoncms/config.git ${EMONCMS_WEB_DIR}/Modules/config
RUN sudo apt-get install -y python-serial python-configobj python-requests
RUN pip install paho-mqtt
RUN ${EMONHUB_DIR}/install.sh

# RUN ${EMONHUB_DIR}//emonhub.py --config-file=/etc/emonhub/emonhub.conf --logfile=/var/log/emonhub/emonhub.log
# /usr/local/bin/emonhub/emonhub.py --config-file=/etc/emonhub/emonhub.conf --logfile=/var/log/emonhub/emonhub.log
#     && sudo chmod 666 /home/pi/data/emonhub.conf \
#     && ${EMONCMS_DIR}/config/install.sh