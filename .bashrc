#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -f /home/stevendejong/.config/cani/completions/_cani.bash ] && source /home/stevendejong/.config/cani/completions/_cani.bash