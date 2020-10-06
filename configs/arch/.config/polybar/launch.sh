#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set monitors and launch bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top &
done

# Launch Polybar, using default config location ~/.config/polybar/config
# Not needed since launching for every monitor above
# polybar bar &

echo "Polybar launched..."
