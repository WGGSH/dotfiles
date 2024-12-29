#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar for each connected monitor
if type "xrandr" > /dev/null; then
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$monitor polybar --reload main &
  done
else
  # Fallback for systems without xrandr
  polybar --reload main &
fi

echo "Polybar launched on all monitors"
