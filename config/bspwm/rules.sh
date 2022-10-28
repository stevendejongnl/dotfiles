#! /bin/sh

# The bspc rule -a command only uses XDG class names, which can be easily found out by using xprop:
# xprop | grep WM_CLASS

bspc config external_rules_command $BSPWM_CONFIG/external_rules.sh

