#! /bin/sh

# https://miikanissi.com/blog/hotplug-dual-monitor-setup-bspwm/

CONNECTED_SPACE=$(autorandr --current)
SPACE_LAPTOP="laptop"
SPACE_OFFICE="office"
SPACE_OFFICE2="office2"
SPACE_HOME="home"
SPACE_DEFAULT="default"
SPACE_DEFAULT_DUAL_MONITOR="default-dual-monitor"

INTERNAL_MONITOR="eDP"
EXTERNAL_MONITOR_ONE="HDMI-A-0"
EXTERNAL_MONITOR_TWO="DisplayPort-0"
AOC_PRIMARY="DisplayPort-2"
AOC_SECONDARY="DisplayPort-1"
LG="HDMI-A-0"

bspc monitor "$EXTERNAL_MONITOR_ONE" --remove
bspc monitor "$EXTERNAL_MONITOR_TWO" --remove
bspc monitor "$AOC_PRIMARY" --remove
bspc monitor "$AOC_SECONDARY" --remove
bspc monitor "$LG" --remove

if [ "$CONNECTED_SPACE" = "$SPACE_LAPTOP" ]; then
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5 6 7 8 9 0
fi

if [ "$CONNECTED_SPACE" = "$SPACE_HOME" ] || [ "$CONNECTED_SPACE" = "$SPACE_OFFICE" ] || [ "$CONNECTED_SPACE" = "$SPACE_OFFICE2" ]; then
    if [ "$CONNECTED_SPACE" = "$SPACE_HOME" ]; then
        bspc monitor "$INTERNAL_MONITOR" -d 1 2 3
        bspc monitor "$EXTERNAL_MONITOR_ONE" -d 4 5 6 7
        bspc monitor "$EXTERNAL_MONITOR_TWO" -d 8 9 0

    elif [ "$CONNECTED_SPACE" = "$SPACE_OFFICE" ]; then
        bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5
        bspc monitor "$EXTERNAL_MONITOR_TWO" -d 6 7 8 9 0

    elif [ "$CONNECTED_SPACE" = "$SPACE_OFFICE2" ]; then
        bspc monitor "$EXTERNAL_MONITOR_ONE" -d 1 2 3 4 5
        bspc monitor "$INTERNAL_MONITOR" -d 6 7 8 9 0
    fi
fi


if [ "$CONNECTED_SPACE" = "$SPACE_DEFAULT" ] || [ "$CONNECTED_SPACE" = "$SPACE_DEFAULT_DUAL_MONITOR" ]; then
    if [ "$CONNECTED_SPACE" = "$SPACE_DEFAULT" ]; then
        bspc monitor "$LG" -d 1 2 3
        bspc monitor "$AOC_PRIMARY" -d 4 5 6 7
        bspc monitor "$AOC_SECONDARY" -d 8 9 0

    elif [ "$CONNECTED_SPACE" = "$SPACE_DEFAULT_DUAL_MONITOR" ]; then
        bspc monitor "$LG" --remove
        bspc monitor "$AOC_PRIMARY" -d 1 2 3 4 5
        bspc monitor "$AOC_SECONDARY" -d 6 7 8 9 0
    fi
fi
