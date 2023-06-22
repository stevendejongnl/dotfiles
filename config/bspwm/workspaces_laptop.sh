#! /bin/sh
/usr/bin/autorandr --change

CONNECTED_SPACE=$(autorandr --current)
SPACE_LAPTOP="laptop"
SPACE_OFFICE="office"
SPACE_OFFICE_HDMI="office-hdmi"
SPACE_HOME="home"

INTERNAL_MONITOR="eDP"
EXTERNAL_MONITOR_DP="DisplayPort-0"
EXTERNAL_MONITOR_HDMI="HDMI-A-0"
AOC_PRIMARY="DisplayPort-2"
AOC_SECONDARY="DisplayPort-1"

if [ "$CONNECTED_SPACE" = "$SPACE_LAPTOP" ]; then
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5 6 7 8 9 0

    bspc monitor "$EXTERNAL_MONITOR_DP" --remove
    bspc monitor "$EXTERNAL_MONITOR_HDMI" --remove
fi

if [ "$CONNECTED_SPACE" = "$SPACE_HOME" ]; then
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3
    bspc monitor "$EXTERNAL_MONITOR_DP" -d 4 5 6 7
    bspc monitor "$EXTERNAL_MONITOR_HDMI" -d 8 9 0
fi

if [ "$CONNECTED_SPACE" = "$SPACE_OFFICE" ]; then
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5
    bspc monitor "$EXTERNAL_MONITOR_DP" -d 6 7 8 9 0

    bspc monitor "$EXTERNAL_MONITOR_HDMI" --remove
fi

if [ "$CONNECTED_SPACE" = "$SPACE_OFFICE_HDMI" ]; then
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5
    bspc monitor "$EXTERNAL_MONITOR_HDMI" -d 6 7 8 9 0

    bspc monitor "$EXTERNAL_MONITOR_DP" --remove
fi

