#! /bin/bash

# runs when `startx` is run

xrdb -load ~/.Xresources &
# sh ~/scripts/setResolution.sh &
xrandr --output DVI-D-1 --scale 1x1 --rate 144 --output DP-3 --auto --scale 1x1 --left-of DVI-D-1 &
exec i3

# exec startxfce4
