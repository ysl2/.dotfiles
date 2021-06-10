#!/bin/bash
# 用于备份宝塔面板
if [[ "$(docker images -q baota 2> /dev/null)" != "" ]];
then
  docker rmi baota
fi
docker commit -a "backup_shell" -m "backup baota" -p baota baota
docker save -o baota.tar baota


# 导入备份：
# 1. 把压缩包上传到新的服务器
# 2. 把压缩包载入docker
#
#   ```bash
#   docker load -i baota.tar
#   ```
#
# 3. 恢复容器
#
#   ```bash
#   # 执行restore.sh
#   ```
