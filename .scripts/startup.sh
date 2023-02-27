#!/bin/bash 

# Launch polybar.
~/.config/polybar/launch.sh

# Set wallpaper AFTER compositor.
feh --bg-fill ~/.wallpapers/ring.jpg
# Start compositor.
# picom --config ~/.config/picom/picom.conf 


# Get rid of that screen tearing.
# Unsure if this will make startup slower?...
# nvidia-force-comp-pipeline


# Setup the arandr monitor layout AFTER compositor and BEFORE wallpaper.
# ~/.screenlayout/default_triple_monitor.sh 

# feh --bg-fill ~/.wallpapers/IGN_Astronaut_Nord.png
