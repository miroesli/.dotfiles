#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"/among-trees
# cd "$parent_path"/$1

cp -r .config/ ~
cp .Xresources ~
cp .xinitrc ~
cp .xsettingsd ~
cp .zshrc ~
cp .vimrc ~
wal -i ../../wallpapers/forestlake.png