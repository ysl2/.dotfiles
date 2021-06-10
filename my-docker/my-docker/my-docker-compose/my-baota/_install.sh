#!/bin/bash
# 用于安装宝塔面板
docker run -tid --name baota --net=host --privileged=true --shm-size=1g --restart always -v baota_www:/www -v ~/wwwroot:/www/wwwroot pch18/baota

# 登录地址：http://{{ip地址}}:8888
# 初始帐号：username
# 初始密码：password

# 进入容器：docker exec -it baota bash
# 在容器内输入bt并按回车后，可进行交互式操作
