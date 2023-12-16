#!/bin/bash

resolution=$(xrandr | grep -A1 "^HDMI-1" | tail -n1 | awk '{print $1}')

case $resolution in
    "1920x1080")
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal;;
    "3840x2160")
        xrandr --newmode "1920x1200"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync;
        xrandr --addmode HDMI-1 1920x1200;
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1200 --pos 0x0 --rotate normal;;
    "*")
        xrandr --outpt eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal;;
esac
