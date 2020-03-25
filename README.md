# install docker on a raspberry pi
tested on rpi3b+

from your laptop:
--------------
download the official raspibian buster lite [I'm using 2020-02-13-raspbian-buster-lite.zip](magnet:?xt=urn:btih:2213f24bca4031663b3dfa99fb554dce8cfcb5da&dn=2020-02-13-raspbian-buster-lite.zip&tr=http%3A%2F%2Ftracker.raspberrypi.org%3A6969%2Fannounce)
burn image to micro sd card using Etcher
once completed (7mins for me), remove and re-insert sd card
put empty file onto /boot partition named `ssh` to enable headless remote access
unmount the sd card (eject/sefely remove) and put it into the raspberry pi
turn on the raspberry pi
get the new ip 
login via ssh `$ ssh pi@192.168.1.[0-254]` into a terminal window

from the pi
-------------
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
echo 'arm_64bit=1' | sudo tee -a /boot/config.txt
yes | sudo RPI_REBOOT=1 rpi-update

[login again via ssh]


from the pi
-------------
sudo apt-get update && sudo apt-get install -y libffi-dev libssl-dev python3 python3-pip git-core
sudo pip3 install docker-compose
git clone https://github.com/emrysr/emoncms-docker-fpm.git && cd emoncms-docker-fpm
git checkout -b stage1-5-emonhub && git pull origin stage1-5-emonhub
docker-compose up
