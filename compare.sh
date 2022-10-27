#! /bin/bash

REPODIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

DIFFTOOL=$(git config diff.tool);
if [[ -z "$DIFFTOOL" ]]; then
	echo "No configured git diff tool found, please configure with 'git config --global diff.tool <difftool>'";
	exit
fi

LOCAL_TO_REMOTE="false"
read -r -p "Compare local to remote? [Y/n]" compare_config_files
if [[ ! "$compare_config_files" =~ ^([nN][oO]|[nN])$ ]]; then
	LOCAL_TO_REMOTE="true"
fi

read -r -p "Compare .config files? [Y/n] " compare_config_files
if [[ ! "$compare_config_files" =~ ^([nN][oO]|[nN])$ ]]; then
	if [[ "${LOCAL_TO_REMOTE}" == "true" ]]; then
		$DIFFTOOL "$HOME/.config" "$REPODIR/config"
	else
		$DIFFTOOL "$REPODIR/config" "$HOME/.config"
	fi
fi

read -r -p "Compare .zshrc file? [Y/n] " compare_zshrc_file
if [[ ! "$compare_zshrc_file" =~ ^([nN][oO]|[nN])$ ]]; then
	if [[ "${LOCAL_TO_REMOTE}" == "true" ]]; then
		$DIFFTOOL "$HOME/.zshrc" "$REPODIR/zshrc"
	else
		$DIFFTOOL "$REPODIR/zshrc" "$HOME/.zshrc"
	fi
fi

read -r -p "Compare .aliases file? [Y/n] " compare_aliases_file
if [[ ! "$compare_aliases_file" =~ ^([nN][oO]|[nN])$ ]]; then
	if [[ "${LOCAL_TO_REMOTE}" == "true" ]]; then
		$DIFFTOOL "$HOME/.aliases" "$REPODIR/aliases"
	else
		$DIFFTOOL "$REPODIR/aliases" "$HOME/.aliases"
	fi
fi
