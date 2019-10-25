# commands: setMonitors.sh [--right-to-left | --left-to-right ] 
# right to let by default

xrandr --listmonitors
# get the monitor names, and then iterate through all monitors and 
# xrandr --output monitor --scale 1x1