#! /bin/bash

if [ ! -d "yay-bin" ] ; then
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
else
    cd yay-bin
    git pull https://aur.archlinux.org/yay-bin.git
fi

makepkg -si -y
