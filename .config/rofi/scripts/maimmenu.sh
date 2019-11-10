#!/bin/bash

rofi_command="rofi -theme themes/screenshotmenu.rasi"

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; maim ~/Pictures/$(date +%s)_maim.png
        ;;
    $area)
        maim -s -u -l ~/Pictures/$(date +%s)_maim.png
        ;;
    $window)
        sleep 1; maim -s ~/Pictures/$(date +%s)_maim.png
        ;;
esac

