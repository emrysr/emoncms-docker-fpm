#!/bin/bash
# HOST MACHINE REBOOT INTERFACE
# listen for changes to $file. 
# if $file contents === "true", system reboots
#
# thanks to [mat](https://stackoverflow.com/users/1318694/matt)
# https://stackoverflow.com/users/1318694/matt

file=/home/pi/emoncms-docker-fpm/shutdown_signal

echo "waiting" > $file
while inotifywait -e close_write $file; do 
  signal=$(cat $file)
  if [ "$signal" == "shutdown" ]; then 
    sudo echo "shutdown done" > file
    sudo shutdown -h now
  elif [ "$signal" == "reboot" ]; then
    sudo echo "reboot done" > file
    sudo shutdown -r now
  fi
done
