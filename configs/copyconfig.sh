#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"/among-trees
# cd "$parent_path"/$1

# TODO: Need to check here if path exists

cp -r .config/ ~
cp .Xresources ~
cp .xinitrc ~
cp .xsettingsd ~
cp .zshrc ~