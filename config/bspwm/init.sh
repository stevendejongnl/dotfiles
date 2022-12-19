#! /bin/sh

#dex --autostart
systemctl --user start autostart.target

# Disable touchpad middle click
# https://unix.stackexchange.com/questions/438725/disabling-middle-click-on-bottom-of-a-clickpad-touchpad
## default xinput set-button-map 17 1 2 3 4 5 6 7
TOUCHPAD_DEVICE_ID=$(xinput list --id-only 'ETPS/2 Elantech Touchpad')
xinput set-button-map $TOUCHPAD_DEVICE_ID 1 1 3 4 5 6 7

sleep 3
WALLPAPERS=$HOME/Pictures/wallpapers
RANDOM_WALLPAPER=$(find $WALLPAPERS/* -xtype f | shuf -n 1) &&
	feh --bg-fill "$RANDOM_WALLPAPER"
