# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share

export GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles

export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"

for i in $GUIX_EXTRA_PROFILES/*; do
  profile=$i/$(basename "$i")
  if [ -f "$profile"/etc/profile ]; then
    GUIX_PROFILE="$profile"
    . "$GUIX_PROFILE"/etc/profile
  fi
  unset profile
done

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export DENO_INSTALL="/home/peter/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
