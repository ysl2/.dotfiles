#!/bin/bash

docker pull ibex/debian-mysql-server-5.7

docker run \
    -d \
    --name mysql \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_ROOT_HOST=% \
    ibex/debian-mysql-server-5.7
