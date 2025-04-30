#!/bin/sh

SLSTATUS_DIR="$HOME/.dwm/slstatus"
OUTPUT=""

get_battery_state() {
  OUTPUT+="$("$SLSTATUS_DIR"/battery.sh)"
}

get_cpu_usage() {
  OUTPUT+="$("$SLSTATUS_DIR"/cpu-usage.sh)"
}

get_memory_usage() {
  OUTPUT+="$("$SLSTATUS_DIR"/memory-usage.sh)"
}

get_package_updates() {
  OUTPUT+="$("$SLSTATUS_DIR"/package-updates.sh)"
}

get_pipewire() {
  OUTPUT+="$("$SLSTATUS_DIR"/pipewire.sh)"
}

get_bluetooth() {
  OUTPUT+="$("$SLSTATUS_DIR"/bluetooth.sh)"
}

get_date() {
  OUTPUT+="[   $(date '+%F %T') ]"
}

get_date
get_battery_state
# get_cpu_usage
# get_memory_usage
get_package_updates
get_pipewire
get_bluetooth

printf "%s" "$OUTPUT"

sleep 15 
exit
