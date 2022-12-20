#! /bin/bash

mkdir -p /etc/systemd/system/getty@tty1.service.d
echo -e "[Service]\nTTYVTDisallocate=no\n" > /etc/systemd/system/getty@tty1.service.d/noclear.conf
