#!/usr/bin/env sh

# restart polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# polybar -c ~/.config/polybar/config example &
sh ~/.config/polybar/launch.sh
echo "Polybars relaunched..."
