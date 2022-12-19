#! /bin/bash

# Create the user custom module directory
mkdir ~/.ansible/plugins/modules

# Install the aur module into the user custom module directory
curl -o ~/.ansible/plugins/modules/aur.py https://raw.githubusercontent.com/kewlfft/ansible-aur/master/plugins/modules/aur.py
