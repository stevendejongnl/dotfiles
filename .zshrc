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
export NVM_DIR="$HOME/workspace/cloudsuite/customer-themes/showdown/src/apps/configurator-app/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/stevendejong/.lmstudio/bin"
# End of LM Studio CLI section
