#! /bin/sh

/usr/bin/autorandr --change

AOC_PRIMARY="DisplayPort-2"
AOC_SECONDARY="DisplayPort-1"
bspc monitor "$AOC_SECONDARY" -d 1 2 3 4 5
bspc monitor "$AOC_PRIMARY" -d 6 7 8 9 0
