#!/bin/bash

sudo ln -s /lib/systemd/system/lightdm.service /etc/systemd/system/lightdm.service
sudo ln -s /lib/systemd/system/lightdm.service /etc/systemd/system/multi-user.target.wants/lightdm.service
