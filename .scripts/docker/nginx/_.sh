#!/bin/bash
# NOTE: You only need to modify www project target. Don't modify port.
#
# Hints: htpasswd
# File location: ./etc/nginx/htpasswd
# Don't use `-b` option, otherwise nginx won't update htpasswd config.
#
# ```
# # Add new htpasswd config:
# htpasswd -c ./htpasswd user1
#
# # Update htpasswd config:
# htpasswd ./htpasswd user2
# ```
#
# (Deprecated: No need to run `docsify serve`.)
# If you want to deploy docsify into nginx docker:
#
# 1. Add this line below into your docker run command:
#
#   ```
#   -v /home/yusongli/.bin/lib-nodejs:/bin/lib-nodejs \
#   ```
#
# 2. send docsify binary into container, and docsify serve page:
#
#    ```
#    # Exec this when you are outside container:
#    sudo docker exec -it nginx /bin/bash
#
#    # After into container:
#    ln -s /bin/lib-nodejs/bin/node /bin/node
#    cd /www
#    /bin/lib-nodejs/bin/docsify serve &
#    ```
#
sudo docker run \
    -d \
    -p 80:80 \
    -v /home/yusongli/Public/docker/nginx/80/docsify:/www \
    -v /home/yusongli/.dotker/nginx/etc/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v /home/yusongli/.dotker/nginx/etc/nginx/htpasswd:/etc/nginx/htpasswd \
    -v /home/yusongli/.dotker/nginx/etc/nginx/nginx.conf:/etc/nginx/nginx.conf \
    --name nginx \
    nginx
