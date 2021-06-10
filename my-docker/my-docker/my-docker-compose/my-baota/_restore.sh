#!/bin/bash
# 用于在新服务器上恢复宝塔面板
docker run -tid --name baota --net=host --privileged=true --shm-size=1g --restart always -v baota_www:/www -v ~/wwwroot:/www/wwwroot baota
