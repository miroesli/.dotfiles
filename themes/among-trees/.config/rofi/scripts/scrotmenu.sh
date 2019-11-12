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
        sleep 1; scrot '%Y-%m-%d_$wx$h_scrot.png' -e 'mv $f ~/Pictures/'
        ;;
    $area)
        scrot -s '%Y-%m-%d_$wx$h_scrot.png' -e 'mv $f ~/Pictures/'
        ;;
    $window)
        sleep 1; scrot -u '%Y-%m-%d_$wx$h_scrot.png' -e 'mv $f ~/Pictures/'
        ;;
esac

