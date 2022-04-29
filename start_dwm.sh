#!/bin/bash

xset r rate 200 80

dunst &

fcitx5 &

picom --experimental-backends &

# nitrogen --restore &
wallpaper.sh &

dwmblocks &

sxhkd &

# xrandr --newmode "3840x2160_60.00"  533.25  3840 3888 3920 4000  2160 2163 2167 2222  +hsync -vsync
#
# xrandr --addmode DP2 "3840x2160_60.00"
#
# xrandr --output DP2 --mode "3840x2160_60.00" --scale 1.5

exec /usr/local/bin/dwm


