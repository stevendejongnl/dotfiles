export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/share/JetBrains/Toolbox/scripts:/usr/local/bin:$PATH

source $HOME/.zsh-config/autocompletion.zsh
source $HOME/.zsh-config/base.zsh
source $HOME/.zsh-config/plugins.zsh
source $HOME/.zsh-config/fuzzy-find.zsh
source $HOME/.zsh-config/nvm.zsh
source $HOME/.zsh-config/tmate.zsh

eval "$(zoxide init --cmd cd zsh)"
[ -f /home/stevendejong/.config/cani/completions/_cani.zsh ] && source /home/stevendejong/.config/cani/completions/_cani.zsh
eval $(thefuck --alias)
