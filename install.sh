#!/bin/bash
# intended to be ran on docker host

# ADD SIGNAL FILE & inotify PACKAGE
---------------
sudo apt-get update && sudo apt-get install -y inotify-tools
FILE=/var/run/shutdown
sudo touch $FILE
sudo chmod 777 $FILE

# EDIT rc.local
--------------
# run watcher script on boot...
#   looks for blank line before "exit 0" and adds host-shutdown-interface.sh before it 
#   can only be ran once as there will not be a blank line before the "exit 0" line

DIR="$(cd "$(dirname "$0")" && pwd)"
sudo perl -i -0pe "s|\n\nexit 0|\n\n\sudo bash $DIR/host-shutdown-interface.sh &\nexit 0|" /etc/rc.local

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi

# INSTALL DOCKER AND GIT
--------------
sudo apt-get update && sudo apt-get install -y libffi-dev libssl-dev python3 python3-pip git-core
sudo pip3 install docker-compose

# copy files from github
git clone https://github.com/emrysr/emoncms-docker-fpm.git && cd emoncms-docker-fpm
git checkout -b stage1-5-emonhub && git pull origin stage1-5-emonhub

# HOST SHUTDOWN
--------------
# run the host-shutdown-interface.sh before running the docker containers
# (/etc/rc.local will restart it on next boot)
./host-shutdown-interface.sh

# DOCKER COMPOSE
--------------
# run all containers (will restart on reboot)
docker-compose up
