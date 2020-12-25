#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
doas .bin/internet.sh
setxkbmap -model pc104 -layout tr -variant f
 xmodmap -e 'keycode 52= j J j J less VoidSymbol less'
 xmodmap -e 'keycode 53=  odiaeresis Odiaeresis odiaeresis Odiaeresis greater VoidSymbol greater'
xmodmap -e 'keycode 135=Super_L'
sxhkd &
picom &
wal -R &
exec bspwm -c $HOME/.config/bspwm/bspwmrc
