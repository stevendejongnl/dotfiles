#!/bin/sh

SLSTATUS_DIR="$HOME/.dwm/slstatus"
OUTPUT=""

function get_battery_state() {
  OUTPUT+="$($SLSTATUS_DIR/battery.sh)"
}

function get_cpu_usage() {
  OUTPUT+="$($SLSTATUS_DIR/cpu-usage.sh)"
}

function get_memory_usage() {
  OUTPUT+="$($SLSTATUS_DIR/memory-usage.sh)"
}

function get_package_updates() {
  OUTPUT+="$($SLSTATUS_DIR/package-updates.sh)"
}

function get_pipewire() {
  OUTPUT+="$($SLSTATUS_DIR/pipewire.sh)"
}

function get_bluetooth() {
  OUTPUT+="$($SLSTATUS_DIR/bluetooth.sh)"
}

function get_date() {
  OUTPUT+="[   $(date '+%F %T') ]"
}

get_battery_state
get_cpu_usage
get_memory_usage
get_package_updates
get_pipewire
get_bluetooth
get_date

printf "%s" "$OUTPUT"

sleep 15 
exit
