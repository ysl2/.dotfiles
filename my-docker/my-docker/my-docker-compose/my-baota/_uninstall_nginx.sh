#!/bin/bash
# 用于完全清除nginx
sudo service nginx stop
sudo apt-get --purge remove nginx
sudo apt-get --purge remove nginx-common
sudo apt-get --purge remove nginx-core
sudo apt-get autoremove
