#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


WORKSPACE=$(autorandr --current)

if [[ $WORKSPACE == "office" ]]; then
    MONITOR=DisplayPort-0 /usr/bin/polybar main &
    MONITOR=eDP /usr/bin/polybar secondary

elif [[ $WORKSPACE == "office-hdmi" ]]; then
    MONITOR=HDMI-A-0 /usr/bin/polybar main &
    MONITOR=eDP /usr/bin/polybar secondary

elif [[ $WORKSPACE == "home" ]]; then
    MONITOR=HDMI-A-0 /usr/bin/polybar main &
    MONITOR=eDP /usr/bin/polybar secondary &
    MONITOR=DisplayPort-0 /usr/bin/polybar secondary

else
    /usr/bin/polybar main
fi
