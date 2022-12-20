#! /bin/bash

mkdir -p /etc/systemd/journald.conf.d/
echo -e "[Journal]\nForwardToConsole=yesTTYPath=/dev/tty12MaxLevelConsole=info" > /etc/systemd/journald.conf.d/fw-tty12.conf

systemctl restart systemd-journald.service
