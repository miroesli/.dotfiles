#!/bin/bash
configs=(alacritty i3 i3status redshift polybar picom nvim joplin ranger zathura rofi dunst)
dots=(.zshrc .gitconfig .xinitrc)

for config in "${configs[@]}"
do
	cp -r .config/$config ~/.config
done
for dot in "${dots[@]}"
do
	cp $dot ~
done

echo done
