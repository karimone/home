#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main -c $HOME/.config/polybar/config.ini &
polybar bottom -c $HOME/.config/polybar/config.ini

# if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar -c ~/.config/polybar/config --reload example &
#  done
#else
#  polybar --reload example &
#fi
