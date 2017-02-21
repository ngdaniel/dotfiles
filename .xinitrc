#!/bin/sh

sxhkd &
xsetroot -cursor_name left_ptr
xrdb ~/.Xresources
mpd
urxvtd
#syndaemon -i 0.5 -t -K -R
exec bspwm
