#! /bin/bash

if [ ! -d "ansible-aur" ] ; then
    git clone https://github.com/pigmonkey/ansible-aur.git
    cd ansible-aur
else
    cd ansible-aur
    git pull https://github.com/pigmonkey/ansible-aur.git
fi

cp aur /usr/share/ansible
