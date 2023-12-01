#! /bin/bash

killall -q polybar
polybar jojodicus 2>&1 | tee -a /tmp/polybar.log & disown
polybar secondary 2>&1 | tee -a /tmp/polybar.log & disown

# tray icons
nm-applet &
