#! /bin/bash

killall -q polybar
polybar jojodicus 2>&1 | tee -a /tmp/polybar.log & disown

# tray icons
#cbatticon &
nm-applet &
