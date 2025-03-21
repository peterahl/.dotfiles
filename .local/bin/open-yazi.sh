#!/bin/bash

PANE_OUTPUT=$(tmux capture-pane -p)
RES=$(echo "$PANE_OUTPUT" | rg -e "(?:NOR|INS|SEL)\s*[⡀-⣿]?\s*(\S*)\s[^│]* (\d+):*.*" -o --replace '$1 $2')

FILE=$(echo $RES | choose 0)
LINE=$(echo $RES | choose 1)

# Handle tilde expansion before passing to realpath
if [[ "$FILE" == "~"* ]]; then
  FILE="${FILE/#\~/$HOME}"
fi

ABSOLUTE_FILE_PATH=$(realpath "$FILE")

# Open a floating Tmux window and start Yazi in the current directory
tmux popup -h 90% -w 90% -E "yazi '$ABSOLUTE_FILE_PATH'"



