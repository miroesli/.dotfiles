#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"/

echo [Attempting to remove $1 config]
stow -D $1/.config/ -t ~/.config/