#! /bin/bash

USER=${USER:-$(id -u -n)}
ZSH=$(which zsh)
sudo -k chsh -s "$ZSH" "$USER"
