#! /bin/bash

autorandr --change &

# sleep 5
darkman set dark &
systemctl --user restart wallpaper.service &
systemctl --user start autostart.target &
