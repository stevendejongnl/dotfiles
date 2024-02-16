#!/bin/bash

# Function to retrieve battery percentage of a Bluetooth device
get_battery_percentage() {
  # Extract the battery percentage from the info provided by "info" command
  battery_info=$(echo -e "info $1\n" | bluetoothctl | grep "Battery\|Connected:")
  # Extract the percentage value
  percentage=$(echo "$battery_info" | grep "Battery Percentage:" | awk '{print $3}')
  # Check if percentage contains 'x' or 'X'
  if [[ "$percentage" == *x* || "$percentage" == *X* ]]; then
    # Extract percentage value if in hex format
    percentage=$(echo "$percentage" | tr -dc '0-9a-fA-F')
    # Convert hex percentage to decimal
    percentage=$((16#$percentage))
  fi
  echo "$percentage"
}

# Function to retrieve device name of a Bluetooth device
get_device_name() {
  # Extract the device name from the info provided by "info" command
  name_info=$(echo -e "info $1\n" | bluetoothctl | grep "Name:")
  # Extract the name value
  name=$(echo "$name_info" | awk '{$1=""; print $0}' | xargs)
  echo "$name"
}

# Function to get icon based on device name
get_icon() {
  case $1 in
  "MDR-XB950N1")
    echo "🎧"
    ;; # Headphone icon
  "MX Master 2S")
    echo "🖱️"
    ;; # Mouse icon
  *)
    echo "📱"
    ;; # Generic device icon
  esac
}

# Get list of connected Bluetooth devices
devices=$(echo -e "devices\n" | bluetoothctl | grep "Device " | awk '{print $2}')

# Loop through each connected device and get battery percentage, device name, and icon
for device in $devices; do
  percentage=$(get_battery_percentage "$device")
  if [ -n "$percentage" ]; then
    name=$(get_device_name "$device")
    icon=$(get_icon "$name")
    # Print device name, icon, address, and battery percentage
    # echo "Device Name: $name - Icon: $icon - Address: $device - Battery Percentage: $percentage%"

    echo "$icon $percentage% • "
  fi
done
