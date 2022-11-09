#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

WORKSPACE=$(autorandr --current)

if [[ $WORKSPACE == "office" ]]; then
    MONITOR=DisplayPort-0 polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
    MONITOR=eDP polybar secondary 2>&1 | tee -a /tmp/polybar-secondary.log & disown
elif [[ $WORKSPACE == "office2" ]]; then
    MONITOR=HDMI-A-0 polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
    MONITOR=eDP polybar secondary 2>&1 | tee -a /tmp/polybar-secondary.log & disown
elif [[ $WORKSPACE == "home" ]]; then
    MONITOR=HDMI-A-0 polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
    MONITOR=eDP polybar secondary 2>&1 | tee -a /tmp/polybar-secondary.log & disown
    MONITOR=DisplayPort-0 polybar tertiary 2>&1 | tee -a /tmp/polybar-tertiary.log & disown
else
    polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
fi
