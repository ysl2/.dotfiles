#!/bin/bash
# NOTE:
# Put your vault in `vaults/` folder.
# Link your `.obsidian/` folder into your vault
# You can put `.obsidian/` into `vaults/.obsidian/`
# Like this:
# ```
# obsidian_root/
#   |-config/
#   |-vaults/
#       |-.obsidian/
#       |-myvault/
#           |-.obsidian -> ../.obsidian
#           |-README.md
# ```
sudo docker run \
    -d \
    -p 8000:8080 \
    -v /home/yusongli/Public/docker/obsidian/8000/vaults:/vaults \
    -v /home/yusongli/Public/docker/obsidian/8000/config:/config \
    -e PUID=1000 \
    -e PGID=1000 \
    --name obsidian \
    togettoyou/ghcr.io.sytone.obsidian-remote:latest
