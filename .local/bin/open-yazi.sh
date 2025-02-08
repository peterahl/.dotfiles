#!/bin/bash

PANE_OUTPUT=$(tmux capture-pane -p)
RES=$(echo "$PANE_OUTPUT" | rg -e "(?:NOR|INS|SEL)\s*[⡀-⣿]?\s*(\S*)\s[^│]* (\d+):*.*" -o --replace '$1 $2')

FILE=$(echo $RES | choose 0)
LINE=$(echo $RES | choose 1)
ABSOLUTE_FILE_PATH=$(realpath "$FILE")

# Open a floating Tmux window and start Yazi in the current directory
tmux popup -h 90% -w 90% -E "yazi '$ABSOLUTE_FILE_PATH'"



