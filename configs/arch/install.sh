#!/bin/bash
configs=(alacritty dunst i3 i3status redshift)
dots=(.zshrc)

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
