if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx "$HOME/.config/X11/xinitrc"
fi


# Added by Toolbox App
export PATH="$PATH:/home/stevendejong/.local/share/JetBrains/Toolbox/scripts"

