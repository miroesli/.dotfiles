#!/bin/bash

# - Check if restow can be used on empty dir
# - Check if stow is actually a hard link
# Check if backup works correctly
# does it backup stowed files correctly?
# does mkdir work correctly?
# Check that ls -a | grep -w ".profile" doesn't get zprofile as well

exclude_configs=(
	i3blocks
	i3status
	alacritty
	bat
	dunst
	gtk-2.0
	gtk-3.0
	i3
	joplin
	mpd
	ncmpcpp
	nvim
	picom
	polybar
	ranger
	redshift
	rofi
	zathura
)

exclude_dots=(
	.bashrc
	.gitconfig
	.zshrc
	.xinitrc
	# .profile
	# .Xresources
	.p10k.zsh
	# .zprofile
)

# Default settings
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGS=$(ls "${BASEDIR}"/.config)
DOTS=$(find "${BASEDIR}" -type f -name ".[^.]*" -printf "%f ")
REPO=${REPO:-miroesli/dotfiles}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}

# Other options
BACKUP=${KEEP_CONFIGS:-yes}
STOW=${STOW:-no}
VERBOSE=${VERBOSE:-no}

setup_dotconfigs() {
	# Select, install, and update configs for packages
	for config in ${CONFIGS[@]}; do
		# if config not excluded then install
		echo "${exclude_configs[@]}" | grep -wq $config
		if [[ $? -eq 1 ]]; then
			if [ ${BACKUP} = yes ]; then
				if [ -d ~/.config/$config ]; then
					echo "Found old ${config} config. Backing up to ~/.config/${config}-$(date +%Y-%m-%d_%H-%M-%S).bak."
					OLD_CONFIG="~/.config/${config}-$(date +%Y-%m-%d_%H-%M-%S).bak"
					echo $OLD_CONFIG
					# mv ~/.config/$config "$OLD_CONFIG"
				fi
			fi
			if [ ${VERBOSE} = yes ]; then
				echo "Copying ${config}: ${BASEDIR}/.config/${config} --> ~/.config/${config}"
			fi
			mkdir -p ~/.config/$config
			if [ ${STOW} = yes ]; then
				stow -nvt ~/.config/$config -d ${BASEDIR}/.config -S $config
			else
				cp -r ${BASEDIR}/.config/$config ~/.config
			fi
		fi
	done
}

# Future work
# setup_fonts() {}
# setup_gtk() {}

setup_dots() {
	# Select and update dots
	for dot in ${DOTS[@]}; do
		# if config not excluded then install
		echo "${exclude_dots[@]}" | grep -wqo $dot
		if [[ $? -eq 1 ]]; then
			if [ ${BACKUP} = yes ]; then
				if [ -f ${BASEDIR}/$dot ] || [ -h ${BASEDIR}/$dot ]; then
					echo "Found old ${dot} file. Backing up to ~/${dot}-$(date +%Y-%m-%d_%H-%M-%S).bak."
					OLD_DOT="~/${dot}-$(date +%Y-%m-%d_%H-%M-%S).bak"
					echo $OLD_DOT
					# mv ~/$dot "$OLD_DOT"
				fi
			fi
			if [ ${VERBOSE} = yes ]; then
				echo "Copying ${dot}: ${BASEDIR}/${dot} --> ~/${dot}"
			fi
			if [ ${STOW} = yes ]; then
				stow -nvt ~/.config/$config -d ${BASEDIR}/.config -S $config
			else
				cp ${BASEDIR}/$dot ~
			fi
		fi
	done
}

main() {
	# Parse arguments
	while [ $# -gt 0 ]; do
		case $1 in
			--no-backup) BACKUP=no ;;
			--stow) STOW=yes ;;
			--verbose) VERBOSE=yes ;;
		esac
		shift
	done
	if [ ${VERBOSE} = yes ]; then
		echo "BACKUP:" ${BACKUP}, "STOW:" ${STOW} 
	fi

	# Future work to add selecting package and dot exclusions
	setup_dotconfigs
	setup_dots
	echo Done... Configs Installed!
}

main "$@"
