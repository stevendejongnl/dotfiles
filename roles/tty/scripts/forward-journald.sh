#! /bin/bash

mkdir -p /etc/systemd/journald.conf.d/
echo -e "[Journal]\nForwardToConsole=yes\nTTYPath=/dev/tty12\nMaxLevelConsole=info\n" > /etc/systemd/journald.conf.d/fw-tty12.conf

systemctl restart systemd-journald.service
