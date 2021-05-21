#!/usr/bin/bash

#sudo mkdir -p /home/yusoli/Public/sda1
#sudo mount /dev/sda1 /home/yusoli/Public/sda1
#sudo mkdir -p /home/yusoli/Public/sda5
#sudo mount /dev/sda5 /home/yusoli/Public/sda5
#sudo mkdir -p /home/yusoli/Public/sda6
#sudo mount /dev/sda6 /home/yusoli/Public/sda6

sudo mkdir -p /home/yusoli/Public/sda1
sudo mount -o rw /dev/sda1 /home/yusoli/Public/sda1
sudo mkdir -p /home/yusoli/Public/sda5
sudo mount -o rw /dev/sda5 /home/yusoli/Public/sda5
sudo mkdir -p /home/yusoli/Public/sda6
sudo mount -o rw /dev/sda6 /home/yusoli/Public/sda6
