#! /bin/bash

# runs when `startx` is run

xrdb -load ~/.Xresources &
compton --config ~/.config/compton.conf &
sh ~/scripts/setResolution.sh &
feh --bg-scale ~/Pictures/wallpapers/abstract.jpg &
wal -i ~/Pictures/wallpapers/abstract.jpg & 
xrandr --output eDP1 --scale 1x1 --output DP1 --auto --scale 1x1 --left-of eDP1 &
exec i3

# exec startxfce4