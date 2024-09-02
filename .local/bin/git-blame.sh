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

# Function to get the commit URL
get_commit_url() {
    local commit_hash=$1
    local remote_url=$(git config --get remote.origin.url)
    
    # Remove .git extension if present
    remote_url=${remote_url%.git}
    
    # Convert SSH URL to HTTPS URL if necessary
    if [[ $remote_url == git@* ]]; then
        remote_url=$(echo $remote_url | sed 's|git@\(.*\):|https://\1/|')
    fi
    
    # Construct the commit URL
    echo "${remote_url}/commit/${commit_hash}"
}

# Create a temporary file to store the fzf result
TEMP_FILE=$(mktemp)

# Run fzf in a Tmux popup and save the result to the temporary file
tmux popup -h 90% -w 90% -E "git blame -L $LINE,+100 '$RELATIVE_PATH' --color-by-age --color-lines | 
    fzf --ansi \
        --border \
        --delimiter ' ' \
        --nth 1 \
        --height '100%' \
        --exit-0 \
        --scrollbar '▍' \
        --bind 'ctrl-c:abort' \
        --with-nth 2.. \
        --no-multi | cut -d' ' -f1 > $TEMP_FILE"

# Read the content of the temporary file
commit_hash=$(cat "$TEMP_FILE")

# Remove the temporary file
rm "$TEMP_FILE"

# Check if a selection was made
if [ -n "$commit_hash" ]; then
    # Get the commit URL
    commit_url=$(get_commit_url "$commit_hash")
    
    # Open the commit URL using xdg-open
    if [ -n "$commit_url" ]; then
        echo "Opening URL for commit $commit_hash: $commit_url"
        xdg-open "$commit_url"
    else
        echo "Failed to construct commit URL for $commit_hash."
    fi
else
    echo "Operation aborted or no selection made."
fi
