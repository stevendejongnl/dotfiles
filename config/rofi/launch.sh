#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='catppucin-mocha'

## Run
rofi \
	-show drun \
	-theme ${dir}/${theme}.rasi
