#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Set monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

# for m in $(polybar --list-monitors | cut -d":" -f1); do
#     MONITOR=$m polybar --reload example &
# done

# Launch bar
# Bar is the name set in the polybar config, so if you change it, you have to change it here too.

polybar bar

echo "Bars launched..."
