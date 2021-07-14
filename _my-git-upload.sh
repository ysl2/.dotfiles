#!/bin/bash

# upload my dotfiles
# git submodule foreach 'git add . && git commit -m "$(date +"%Y-%m-%d %H:%M:%S")" && git push origin master'
git add .
git commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
git push origin master
