#! /bin/bash

#!/bin/bash

WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
LOG_FILE="$WALLPAPERS_DIR/log.txt"

echo "===== $(date) =====" >> "$LOG_FILE"
echo "Searching for wallpapers in: $WALLPAPERS_DIR" >> "$LOG_FILE"

# Functie om door mappen te loopen en bestanden aan de lijst toe te voegen
function find_wallpapers {
    local dir="$1"
    local file
    shopt -s nullglob  # Voorkomt problemen als er geen bestanden zijn in de map
    for file in "$dir"/*; do
        if [[ -d "$file" ]]; then
            find_wallpapers "$file"  # Recursief door de submap loopen
        elif [[ -f "$file" && $file =~ \.(jpg|jpeg|png|gif)$ ]]; then
            echo "$file" >> "$LOG_FILE"
            wallpapers_list+=("$file")
        fi
    done
}

wallpapers_list=()
find_wallpapers "$WALLPAPERS_DIR"

if [[ ${#wallpapers_list[@]} -gt 0 ]]; then
    RANDOM_INDEX=$((RANDOM % ${#wallpapers_list[@]}))
    RANDOM_WALLPAPER="${wallpapers_list[RANDOM_INDEX]}"
    echo "Selected wallpaper: $RANDOM_WALLPAPER" >> "$LOG_FILE"
    feh --bg-fill "$RANDOM_WALLPAPER"
else
    echo "No wallpapers found in the specified folder." >> "$LOG_FILE"
fi

echo "=====================" >> "$LOG_FILE"

notify-send -i monitor 'Wallpaper' 'changed'
