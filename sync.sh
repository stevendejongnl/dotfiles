#! /bin/bash

REPODIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

DIFFTOOL=$(git config diff.tool);
if [[ -z "$DIFFTOOL" ]]; then
	echo "No configured git diff tool found, please configure with 'git config --global diff.tool <difftool>'";
	exit
fi

ASKQUESTION=true
case "$1" in
	-y|--yes)
		ASKQUESTION=false
		;;
	*) a=$d ;;
esac

compare () {
	QUESTION=$1
	FILE_ONE=$2
	FILE_TWO=$3

	if "$ASKQUESTION" ; then
		read -r -p "${QUESTION} [Y/n]" QUESTION_ANSWER
		if [[ ! "$QUESTION_ANSWER" =~ ^([nN][oO]|[nN])$ ]]; then
			$DIFFTOOL "$FILE_ONE" "$FILE_TWO"
		fi
	else
		$DIFFTOOL "$FILE_ONE" "$FILE_TWO"
	fi
}

compare "Compare .config files?" "$HOME/.config" "$REPODIR/config"
compare "Compare .zshrc file?" "$HOME/.zshrc" "$REPODIR/home/zshrc"
compare "Compare .aliases file?" "$HOME/.aliases" "$REPODIR/home/aliases"
compare "Compare .vimrc file?" "$HOME/.vimrc" "$REPODIR/home/vimrc"
compare "Compare .zprofile file?" "$HOME/.zprofile" "$REPODIR/home/zprofile"
compare "Compare /etc/fstab file?" "/etc/fstab" "$REPODIR/etc/fstab"

