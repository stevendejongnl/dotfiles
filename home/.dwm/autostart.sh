#! /bin/bash

autorandr --change &

# sleep 5
systemctl --user restart wallpaper.service &
systemctl --user start autostart.target &

darkman set dark &
