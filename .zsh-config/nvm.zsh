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
