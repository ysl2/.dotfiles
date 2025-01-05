#!/bin/bash

docker pull redis:5.0.5

docker run \
    -d \
    --name redis \
    -p 6379:6379 \
    redis:5.0.5 \
    redis-server --appendonly yes --requirepass 1234
