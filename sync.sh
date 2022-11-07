#! /bin/bash

REPODIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

DIFFTOOL=$(git config diff.tool);
if [[ -z "$DIFFTOOL" ]]; then
	echo "No configured git diff tool found, please configure with 'git config --global diff.tool <difftool>'";
	exit
fi

compare () {
	QUESTION=$1
	FILE_ONE=$2
	FILE_TWO=$3

	read -r -p "${QUESTION} [Y/n]" QUESTION_ANSWER
	if [[ ! "$QUESTION_ANSWER" =~ ^([nN][oO]|[nN])$ ]]; then
		$DIFFTOOL "$FILE_ONE" "$FILE_TWO"
	fi
}

compare "Compare .config files?" "$HOME/.config" "$REPODIR/config"
compare "Compare .zshrc file?" "$HOME/.zshrc" "$REPODIR/zshrc"
compare "Compare .aliases file?" "$HOME/.aliases" "$REPODIR/aliases"
compare "Compare .vimrc file?" "$HOME/.vimrc" "$REPODIR/vimrc"
compare "Compare .zprofile file?" "$HOME/.zprofile" "$REPODIR/zprofile"
compare "Compare /etc/fstab file?" "/etc/fstab" "$REPODIR/fstab"

