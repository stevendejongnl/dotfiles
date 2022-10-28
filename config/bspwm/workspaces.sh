#! /bin/sh

# https://miikanissi.com/blog/hotplug-dual-monitor-setup-bspwm/

CONNECTED_SPACE=$(autorandr --current)
SPACE_LAPTOP="laptop"
SPACE_OFFICE="office"
SPACE_HOME="home"

INTERNAL_MONITOR="eDP"
EXTERNAL_MONITOR_ONE="HDMI-A-0"
EXTERNAL_MONITOR_TWO="DisplayPort-0"

# on first load setup default workspaces
# if [[ "$1" = 0 ]]; then
if [ "$CONNECTED_SPACE" = "$SPACE_HOME" ]; then
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3
    bspc monitor "$EXTERNAL_MONITOR_ONE" -d 4 5 6 7
    bspc monitor "$EXTERNAL_MONITOR_TWO" -d 8 9 0

    bspc config -m "$INTERNAL_MONITOR" top_padding 0
    bspc config -m "$EXTERNAL_MONITOR_ONE" top_padding 24
    bspc config -m "$EXTERNAL_MONITOR_TWO" top_padding 0

elif [ "$CONNECTED_SPACE" = "$SPACE_OFFICE" ]; then
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5
    bspc monitor "$EXTERNAL_MONITOR_ONE" --remove
    bspc monitor "$EXTERNAL_MONITOR_TWO" -d 6 7 8 9 0

    bspc config -m "$INTERNAL_MONITOR" top_padding 0
    bspc config -m "$EXTERNAL_MONITOR_TWO" top_padding 24

else
    bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5 6 7 8 9 0
    bspc monitor "$EXTERNAL_MONITOR_ONE" --remove
    bspc monitor "$EXTERNAL_MONITOR_TWO" --remove

    bspc config -m "$INTERNAL_MONITOR" top_padding 24

fi
# fi

if [ "$CONNECTED_SPACE" = "$SPACE_HOME" ]; then
    if [[ $(bspc query -D -m "${EXTERNAL_MONITOR_ONE}" | wc -l) -ne 5 ]]; then
        monitor_add
    fi
    if [[ $(bspc query -D -m "${EXTERNAL_MONITOR_TWO}" | wc -l) -ne 5 ]]; then
        monitor_add
    fi
    bspc wm -O "$INTERNAL_MONITOR" "$EXTERNAL_MONITOR_ONE" "$EXTERNAL_MONITOR_TWO"

    # https://arcolinuxforum.com/viewtopic.php?t=1686
    bspc config -m "$INTERNAL_MONITOR" top_padding 0
    bspc config -m "$EXTERNAL_MONITOR_ONE" top_padding 24
    bspc config -m "$EXTERNAL_MONITOR_TWO" top_padding 0

elif [ "$CONNECTED_SPACE" = "$SPACE_OFFICE" ]; then
    if [[ $(bspc query -D -m "${EXTERNAL_MONITOR_TWO}" | wc -l) -ne 5 ]]; then
        monitor_add
    fi
    bspc wm -O "$INTERNAL_MONITOR" "$EXTERNAL_MONITOR_TWO"

    # https://arcolinuxforum.com/viewtopic.php?t=1686
    bspc config -m "$INTERNAL_MONITOR" top_padding 0
    bspc config -m "$EXTERNAL_MONITOR_TWO" top_padding 24

else
    if [[ $(bspc query -D -m "${INTERNAL_MONITOR}" | wc -l) -ne 10 ]]; then
        monitor_remove
    fi
    bspc config -m "$INTERNAL_MONITOR" top_padding 24

fi

monitor_add() {
    # Move first 5 desktops to external monitor
    for desktop in $(bspc query -D --names -m "$INTERNAL_MONITOR" | sed 5q); do
        bspc desktop "$desktop" --to-monitor "$EXTERNAL_MONITOR_ONE"
    done

    # Remove default desktop created by bspwm
    bspc desktop Desktop --remove

    # reorder monitors
    bspc wm -O "$INTERNAL_MONITOR" "$EXTERNAL_MONITOR_ONE" "$EXTERNAL_MONITOR_TWO" 
}

monitor_remove() {
    # Add default temp desktop because a minimum of one desktop is required per monitor
    bspc monitor "$EXTERNAL_MONITOR_ONE" -a Desktop
    bspc monitor "$EXTERNAL_MONITOR_TWO" -a Desktop2

    # Move all desktops except the last default desktop to internal monitor
    for desktop in $(bspc query -D -m "$EXTERNAL_MONITOR_ONE");	do
        bspc desktop "$desktop" --to-monitor "$INTERNAL_MONITOR"
    done
    for desktop in $(bspc query -D -m "$EXTERNAL_MONITOR_TWO");	do
        bspc desktop "$desktop" --to-monitor "$INTERNAL_MONITOR"
    done

    # delete default desktops
    bspc desktop Desktop --remove

    # reorder desktops
    bspc monitor "$INTERNAL_MONITOR" -o 1 2 3 4 5 6 7 8 9 0
}
