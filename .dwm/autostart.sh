#! /bin/bash

autorandr --change &

systemctl --user start autostart.target &

darkman set dark &

sleep 5
systemctl --user restart wallpaper.service &
