#! /bin/bash

if [ ! -d "yay-bin" ] ; then
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    yes | makepkg -sifd
fi
