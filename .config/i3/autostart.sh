#!/bin/bash
lxpolkit &
hsetroot -solid "#353535" &
nitrogen --restore &
nm-applet &
(sleep 3s && clipit) &
mate-volume-control-applet &
#xfce4-power-manager &
thunar --daemon &
xset r rate 250 25 &
xset b off &
conky -q &
xss-lock -l blurlock &
setxkbmap -layout 'us,ru' -option 'grp:caps_toggle,grp_led:caps' &
#gxkb $
#fbxkb &
#xcalib ~/.icc/mac-default.icc &
#xmodmap .Xmodmap &
#cbpp-compositor --start &
#xscreensaver -no-splash &