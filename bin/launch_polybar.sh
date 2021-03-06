#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar bottom -c $HOME/.config/polybar/config.ini & MONITOR=$m polybar main -c $HOME/.config/polybar/config.ini &
    done
else
    polybar main -c $HOME/.config/polybar/config.ini & polybar bottom -c $HOME/.config/polybar/config.ini
fi
