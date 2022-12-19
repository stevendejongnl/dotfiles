source $HOME/.auth_tokens

eval $(ssh-agent)

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx "$HOME/.config/X11/xinitrc"
fi
