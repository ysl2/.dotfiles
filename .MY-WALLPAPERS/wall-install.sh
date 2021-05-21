#!/bin/bash
mkdir -p ~/.WALLPAPERS
cd images
for item in $(ls .); do
    ln -s $(pwd)/${item} ~/.WALLPAPERS/
done
