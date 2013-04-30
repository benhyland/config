xrdb -merge $HOME/.Xresources

setxkbmap -layout gb

xsetroot -cursor_name left_ptr

PATH=$PATH:$HOME/.cabal/bin; export PATH

exec xmonad
