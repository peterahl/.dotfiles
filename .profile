export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# export GDK_SCALE=2
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/google-chrome-stable

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
# export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH
export PATH=$HOME/.config/nvim/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/Android/flutter/bin:$PATH
export DENO_INSTALL="/home/peter/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export NVIM_RC=$HOME/.dotfiles/.config/nvim/init.lua
export TERM=xterm-256color

export NNN_FIFO=/tmp/nnn.fifo

export SOPS_PGP_FP=3E2B70479F03FA0AD2080659D75D5B506E2080AD

export ANDROID_SDK_ROOT="$HOME/Android/Sdk"

# setxkbmap -layout us,se,us -variant ,,dvorak -option grp:win_space_toggle,caps:escape
# setxkbmap -option 'ctrl:rctrl_ralt'
# /usr/bin/xmodmap $HOME/.Xmodmap

. "$HOME/.cargo/env"
