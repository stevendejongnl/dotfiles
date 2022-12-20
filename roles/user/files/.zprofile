source $HOME/.auth_tokens

eval $(ssh-agent)

if [[ "$(tty)" = "/dev/tty1" ]]; then
  chvt 2
fi

if [[ "$(tty)" = "/dev/tty2" ]]; then
  pgrep bspwm || startx "$HOME/.config/X11/xinitrc"
fi
