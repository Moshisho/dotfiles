#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy ESIP Password
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔑
# @raycast.packageName Password Manager

# Documentation:
# @raycast.description Copy ESIP_USERP password to clipboard
# @raycast.author moshe.azaria

# Source the .zshrc.local file to get the environment variables
source "$HOME/.zshrc.local" 2>/dev/null

# Copy ESIP_USERP to clipboard
echo "$ESIP_USERP" | pbcopy

echo "Copied ESIP_USERP to clipboard"