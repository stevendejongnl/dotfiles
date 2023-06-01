#! /bin/bash

WALLPAPERS=$HOME/Pictures/wallpapers/desktop
RANDOM_WALLPAPER=$(find $WALLPAPERS/* -xtype f | shuf -n 1) &&
	feh --bg-fill "$RANDOM_WALLPAPER"

notify-send -i monitor 'Wallpaper' 'changed'
