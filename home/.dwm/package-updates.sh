#!/bin/bash

# Path to the status file
status_file="$HOME/.dwm/package-updates/status"

# Path to the last run file
last_run_file="$HOME/.dwm/package-updates/last-run"

# Set the time interval in seconds (30 minutes in this case)
interval=$((30 * 60))

# Function to format the update count
format() {
    if [ "$1" -eq 0 ]; then
        echo '0'
    else
        echo "$1"
    fi
}

# Check if the script has been executed within the time interval
current_time=$(date +%s)
if [ -f "$last_run_file" ]; then
    last_run=$(cat "$last_run_file")
else
    last_run=0
fi

if [ "$((current_time - last_run))" -ge "$interval" ]; then
    # Get the update count for Arch
    if ! updates_arch=$(checkupdates | wc -l); then
        updates_arch=0
    fi

    # Get the update count for AUR
    if ! updates_aur=$(yay -Qum 2>/dev/null | wc -l); then
        updates_aur=0
    fi

    # Calculate the total update count
    updates="$((updates_arch + updates_aur))"

    # Save the update count to the status file
    echo "$updates_arch/$updates_aur" > "$status_file"

    # Update the last run timestamp
    echo "$current_time" > "$last_run_file"
fi

# Read the stored status from the file
if [ -f "$status_file" ]; then
    read -r status < "$status_file"
else
    status="0/0"
fi

# Display the status in the output
if [ "$status" != "0/0" ]; then
    echo "  ($status) |"
fi
