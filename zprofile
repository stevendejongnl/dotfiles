source $HOME/.auth_tokens

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx "$HOME/.config/X11/xinitrc"
fi
