xrdb -merge $HOME/.Xresources

setxkbmap -layout gb

xsetroot -cursor_name left_ptr

LANG=en_GB.UTF-8;		export LANG
LC_ALL=en_GB.UTF-8;		export LC_ALL

PATH=$PATH:$HOME/.cabal/bin; export PATH

exec xmonad
