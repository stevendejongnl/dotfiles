#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-4"
theme='style-3'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye ${USER}" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/shared/confirm.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		if [[ -x '/usr/bin/xsecurelock' ]]; then
		    env XSECURELOCK_COMPOSITE_OBSCURER=0 \
			XSECURELOCK_SAVER=$HOME/screensaver/xsecurelock \
            `# Disable Randr 1.5 support to make screensaver spans accross the whole monitor` \
            XSECURELOCK_NO_XRANDR15=1 \
            `# Delay mapping saver window by 500ms to give some time to saver to start` \
            XSECURELOCK_SAVER_DELAY_MS=500 \
            `# Do not kill screensaver when DPMS is enabled` \
            XSECURELOCK_SAVER_STOP_ON_BLANK=0 \
            `# Do not mess with DPMS settings` \
            XSECURELOCK_BLANK_TIMEOUT=-1 \
            `# Image and text for saver` \
            XSECURELOCK_SAVER_IMAGE=$HOME/Pictures/wallpapers/lucas-segers-6mNKUrwMwFk-unsplash-1920x1080.png \
            `#XSECURELOCK_SAVER_WEATHER=$XDG_RUNTIME_DIR/i3/weather.txt` \
            `# Font for authentication window` \
            #XSECURELOCK_FONT="Iosevka" \
            `# Timeout for authentication window` \
            XSECURELOCK_AUTH_TIMEOUT=10 \
            xsecurelock
		elif [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
