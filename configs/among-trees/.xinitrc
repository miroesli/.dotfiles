#! /bin/bash

# runs when `startx` is run
xrdb -load ~/.Xresources &
# sh ~/scripts/setResolution.sh &
sh ~/dotfiles/scripts/setMonitors.sh &
exec i3
