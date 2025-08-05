#!/bin/bash
# Write the selected file path to a temporary file instead of editing

echo "$1" > /tmp/lazygit-selected-file

# pkill -P $$ lazygit
