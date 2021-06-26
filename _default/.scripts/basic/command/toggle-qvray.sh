#!/bin/bash

result=$(ps ax|grep -v grep|grep qv2ray)
if [ "$result" == "" ]; then
  eval "qv2ray &"
else
  eval "killall qv2ray"
fi
