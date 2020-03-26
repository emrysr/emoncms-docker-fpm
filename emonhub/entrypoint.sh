#!/bin/bash
echo "${EMONHUB_DIR} found"
# apt-get update && apt-get install -y git python-serial python-configobj python-requests build-essential python3-rpi.gpio
# git clone https://github.com/emrysr/emonhub.git ${EMONHUB_DIR}
# git clone https://github.com/emoncms/config.git ${EMONCMS_WEB_DIR}/Modules/config
# pip install paho-mqtt rpi.gpio

# ${EMONHUB_DIR}/sudo-install.sh
# sed -i -n '/dtoverlay=pi3-disable-bt/!p;$a dtoverlay=pi3-disable-bt' /boot/config

# RUN ${EMONHUB_DIR}//emonhub.py --config-file=/etc/emonhub/emonhub.conf --logfile=/var/log/emonhub/emonhub.log
# /usr/local/bin/emonhub/emonhub.py --config-file=/etc/emonhub/emonhub.conf --logfile=/var/log/emonhub/emonhub.log
#     && sudo chmod 666 /home/pi/data/emonhub.conf \
#     && ${EMONCMS_DIR}/config/install.sh