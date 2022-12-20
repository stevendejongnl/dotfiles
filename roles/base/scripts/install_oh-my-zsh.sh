#! /bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Zsh plugins
ZSH_PLUGINS_DIRECTORY=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins
git clone https://github.com/zsh-users/zsh-completions $ZSH_PLUGINS_DIRECTORY/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGINS_DIRECTORY/zsh-autosuggestions
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_PLUGINS_DIRECTORY/autoupdate

USER=${USER:-$(id -u -n)}
ZSH=$(which zsh)
sudo -k chsh -s "$ZSH" "$USER"
