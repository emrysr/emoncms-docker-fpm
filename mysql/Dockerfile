## non arm32 bit
FROM mariadb:latest
## raspberry pi
# FROM yobasystems/alpine-mariadb
# FROM tobi312/rpi-mysql
# comment out "..only listening the localhost.."
RUN if [ -f "$FILE" ]; then sed -i "s/^bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50+