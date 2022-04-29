#!/bin/bash

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DISPLAY=:0
# ls -d /home/tiejun/Pictures/wallpapers/* | shuf | head -n1 | xargs /home/tiejun/.local/bin/xwallpaper --center 2>&1 >> /tmp/wallpaper_dbg.txt
ls -d /home/tiejun/Pictures/wallpapers/* | shuf | head -n1 | xargs /home/tiejun/.local/bin/xwallpaper --center
# tm=$(date)
# echo "wallpaper.sh executed at $tm" >> /tmp/wallpaper_script.log
