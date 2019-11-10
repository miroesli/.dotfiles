#!/usr/bin/env sh

# wal -R

# source ~/.cache/wal/colors.sh
# hsetroot -solid "$background"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# polybar -c ~/.config/polybar/config example &
~/.config/polybar/launch.sh
echo "Polybars relaunched..."

killall -q compton
while pgrep -u $UID -x compton >/dev/null; do sleep 1; done
compton --config ~/.config/compton/compton.conf &
echo "Compton relaunched..."