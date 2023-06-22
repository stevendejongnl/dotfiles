#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='catppuccin-mocha'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
