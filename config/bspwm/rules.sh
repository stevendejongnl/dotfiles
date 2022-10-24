#! /bin/sh

# The bspc rule -a command only uses XDG class names, which can be easily found out by using xprop:
# xprop | grep WM_CLASS

# Rules explained
# -a|--add [class_name or instance_name]
# -o|--one-shot [Run rule once]


# States explained
# tiled
#   Its size and position are determined by the window tree.
#
# pseudo_tiled
#   A tiled window that automatically shrinks but doesn’t stretch beyond its floating size.
#
# floating
#   Can be moved/resized freely. Although it doesn’t use any tiling space, it is still part of the window tree.
#
# fullscreen
#   Fills its monitor rectangle and has no borders.

# Remove previous defined rules
bspc rule -r "*"

bspc config ignore_ewmh_focus true

bspc rule -a Timer-for-harvest follow=off state=floating
bspc rule -a Pavucontrol follow=off state=floating
bspc rule -a Blueman-manager follow=off state=floating

