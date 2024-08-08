#!/bin/bash

PANE_OUTPUT=$(tmux capture-pane -p)

RES=$(echo "$PANE_OUTPUT" | rg -e "(?:NOR|INS|SEL)\s+(\S*)\s[^│]* (\d+):*.*" -o --replace '$1 $2')

FILE=$(echo $RES | choose 0)
LINE=$(echo $RES | choose 1)

# Open a floating Tmux window and start Yazi in the current directory
tmux popup -h 90% -w 90% -E "git blame -L $LINE,+100 $FILE --color-by-age --color-lines | 
                              fzf --ansi \
                                  --border \
                                  --delimiter ':' \
                                  --height '100%' \
                                  --multi \
                                  --print-query --exit-0 \
                                  --scrollbar '▍'"
