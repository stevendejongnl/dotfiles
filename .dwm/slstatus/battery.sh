#!/bin/sh

function get_battery_state() {
  battery_info=$(acpi -b)
  percentage=$(echo "$battery_info" | awk -F ', ' '{print $2}' | awk '{print $1}')
  state=$(echo "$battery_info" | awk -F ', ' '{print $1}' | awk '{print $3}')

  if [ "$state" = "Charging" ]; then
    echo "[  $percentage ]"
  else
    echo "[  $percentage ]"
  fi
}

echo "$(get_battery_state)"
