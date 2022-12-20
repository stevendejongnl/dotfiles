#! /bin/bash

sudo pacman -S ansible

# Create the user custom module directory
mkdir -p $HOME/.ansible/plugins/modules

# Install the aur module into the user custom module directory
curl -o $HOME/.ansible/plugins/modules/aur.py https://raw.githubusercontent.com/kewlfft/ansible-aur/master/plugins/modules/aur.py
