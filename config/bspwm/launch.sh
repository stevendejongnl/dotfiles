#!/usr/bin/env bash

if [[ $1 == "quit" ]]; then
    notify-send -i monitor 'bspwm' 'Quit';
    bspc quit;
elif [[ $1 == "reload" ]]; then
    for node_id in $(bspc query --nodes); do
        bspc node $node_id --to-desktop ^1;
    done

    bspc wm -r;
    bspc desktop -f ^1 --follow
    notify-send -i monitor 'bspwm' 'Reloaded';
fi
