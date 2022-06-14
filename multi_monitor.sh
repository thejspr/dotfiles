#!/bin/sh

echo 'Multi monitor setup'

# xrandr --output DP-1 --auto --pos 0x0
# xrandr --output HDMI-1 --auto --pos 3840x200 --right-of DP-1
xrandr --output DP-1 --auto --scale 1x1 --output HDMI-1 --auto --pos 3840x0 --scale 1x1
