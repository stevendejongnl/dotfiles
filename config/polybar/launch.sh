#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=DisplayPort-2 /usr/bin/polybar main &
MONITOR=DisplayPort-1 /usr/bin/polybar secondary