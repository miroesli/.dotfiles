#!/bin/bash
configs=(alacritty dunst i3 redshift polybar picom nvim joplin)
dots=(.zshrc .vimrc)

for config in "${configs[@]}"
do
	cp -r .config/$config ~/.config
	echo updated $config
done
for dot in "${dots[@]}"
do
	cp $dot ~
	echo updated $dot
done
