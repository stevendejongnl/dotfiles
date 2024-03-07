export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.dotnet/tools:$PATH

export TMPDIR=~/tmp/
export EDITOR='nvim'
export SPACESHIP_CONFIG="$HOME/.config/spaceship.zsh"
# export SSH_ASKPASS=/usr/bin/xaskpass
# export SUDO_ASKPASS=/usr/bin/xaskpass

export ZSH=$HOME/.oh-my-zsh

bindkey '^R' history-incremental-pattern-search-backward
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history

if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

eval "$(direnv hook zsh)"

plugins=(
    direnv
    git
    docker
    history-substring-search
    zsh-completions
    zsh-autosuggestions
    autoupdate
    # wakatime
    bgnotify)

    fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

    source $ZSH/oh-my-zsh.sh
    source $HOME/.aliases

    autoload -U cominit && compinit

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    autoload -U add-zsh-hook
    check_nvm() {
        local nvmrc_path="$(nvm_find_nvmrc)"

        if [ -n "$nvmrc_path" ]; then
            local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

            if [ "$nvmrc_node_version" = "N/A" ]; then
                nvm install
            elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
                nvm use
            fi
        elif [ -f package.json ]; then
            nodeVersion=$(jq -r '.engines.node | select(.!=null)' package.json )

            if [ ! -z $nodeVersion ] && [[ ! $(nvm current) = "^v$nodeVersion" ]]; then
                echo "found $nodeVersion in package.json engine"
                nvm use ${nodeVersion:0:2}
            fi
        fi
    }
    add-zsh-hook chpwd check_nvm
    check_nvm

    eval "$(zoxide init --cmd cd zsh)"
