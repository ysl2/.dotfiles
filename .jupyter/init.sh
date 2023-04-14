#!/bin/bash

# python3 -c "from notebook.auth import passwd; print(passwd())"
# jupyter notebook \
jupyter lab \
    --ip=0.0.0.0 \
    --port=8888 \
    --notebook-dir=~/Public/jupyter \
    --no-browser
