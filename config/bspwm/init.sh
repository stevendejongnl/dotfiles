#! /bin/sh

dex --autostart

sleep 3
WALLPAPERS=$HOME/Pictures/wallpapers
RANDOM_WALLPAPER=$(find $WALLPAPERS/* -xtype f | shuf -n 1) &&
	feh --bg-fill "$RANDOM_WALLPAPER"
