# Set modmap
xmodmap .xmodmap
# Set cursor
xsetroot -cursor_name left_ptr
# Setting the trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype percent --width 6 --transparent true --alpha 0 --tint 0x000000 --height 16 &  
# Set background
sh ~/wallpaper.sh &
# Bind to custom keys
xbindkeys
# Turn off screensaver
xset -dpms; xset s off
# Setup font
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
# Start composite manager
xcompmgr -c &
# Start xmonad
exec xmonad
