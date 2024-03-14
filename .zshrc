export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

source $HOME/.zsh-config/autocompletion.zsh
source $HOME/.zsh-config/base.zsh
source $HOME/.zsh-config/plugins.zsh
source $HOME/.zsh-config/nvm.zsh

eval "$(zoxide init --cmd cd zsh)"
