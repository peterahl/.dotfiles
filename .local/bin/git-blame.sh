#!/bin/bash

set -e

PANE_OUTPUT=$(tmux capture-pane -p)
RES=$(echo "$PANE_OUTPUT" | rg -e "(?:NOR|INS|SEL)\s*[⡀-⣿]?\s*(\S*)\s[^│]* (\d+):*.*" -o --replace '$1 $2')
FILE=$(echo $RES | choose 0)
LINE=$(echo $RES | choose 1)

# Find the Git root directory
GIT_ROOT=$(git rev-parse --show-toplevel)

# Get the current working directory
CURRENT_DIR=$(pwd)

# Calculate the full path of the file
FULL_PATH="$CURRENT_DIR/$FILE"

# Check if the file exists
if [ ! -f "$FULL_PATH" ]; then
    echo "File not found: $FULL_PATH"
    exit 1
fi

# Get the relative path from the Git root
RELATIVE_PATH=$(realpath --relative-to="$GIT_ROOT" "$FULL_PATH")

# Open a floating Tmux window and start Yazi in the current directory
tmux popup -h 90% -w 90% -E "git blame -L $LINE,+100 '$RELATIVE_PATH' --color-by-age --color-lines | 
                              fzf --ansi \
                                  --border \
                                  --delimiter ':' \
                                  --height '100%' \
                                  --multi \
                                  --print-query --exit-0 \
                                  --scrollbar '▍'"
