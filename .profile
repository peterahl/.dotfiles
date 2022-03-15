export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/emacs
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/google-chrome-stable

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export DENO_INSTALL="/home/peter/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export NVIM_RC=$HOME/.dotfiles/.config/nvim/init.lua

setxkbmap -layout us,se,us -variant ,,dvorak -option grp:win_space_toggle,caps:escape
/usr/bin/xmodmap $HOME/.Xmodmap
