## non arm32 bit
# FROM mariadb:latest
## raspberry pi
FROM  tobi312/rpi-mysql
# comment out "..only listening the localhost.."
RUN sed -i "s/^bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf