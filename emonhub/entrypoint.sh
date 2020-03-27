#!/bin/bash
# Disable bluetooth device and restores UART0/ttyAMA0
# once the device tree overlay setting is added to the /boot/config.txt the host must reboot

if [ -z "$REBOOT_TOGGLE" ]; then
  cat >&2 <<EOF
A REBOOT_TOGGLE is required to run this container.
$(printenv|sort)
EOF
  exit 1
fi
exec "$@"

set -e

if [ -e ${REBOOT_TOGGLE} ]
then
    sed -i -n '/dtoverlay=pi3-disable-bt/!p;$a dtoverlay=pi3-disable-bt' /boot/config.txt
    rm ${REBOOT_TOGGLE}
    reboot
else
    #python ${EMONHUB_DIR}/src/emonhub.py
    tail -f /dev/null
fi
