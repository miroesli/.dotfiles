#!/usr/bin/env sh

# commands: setMonitors.sh [-l] [--left] [-r] [--right ] 
# left by default

prevM=""
script="xrandr --output"
first="true"
direction="$1"

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if $first == "true"; then
        first="false"
        script="$script $m --auto --scale 1x1"
    else
        if [ -z $direction ]; then
            script="$script --output $m --auto --scale 1x1 --left-of $prevM"
        elif [ $direction == "--left" -o $direction == "-l" ]; then
            script="$script --output $m --auto --scale 1x1 --left-of $prevM"
        elif [ $direction == "--right" -o $direction == "-r" ]; then
            script="$script --output $m --auto --scale 1x1 --right-of $prevM"
        else
            echo "Command not found: $1"
            echo "Please use setMonitors.sh [-l] [--left] [-r] [--right ]"
        fi
    fi
    prevM="$m"
done

# echo $script
$script
