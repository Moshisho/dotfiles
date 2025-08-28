#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Password
# @raycast.mode silent
# @raycast.argument1 {"type": "text", "placeholder": "e.g., ESIP_USERP"}

# Optional parameters:
# @raycast.icon 🔑
# @raycast.packageName Password Manager

# Documentation:
# @raycast.description Copy password from .zshrc.local to clipboard
# @raycast.author moshe.azaria

PASSWORD_VAR="$1"

if [ -z "$PASSWORD_VAR" ]; then
    echo "Please specify a password variable name"
    exit 1
fi

# Source the .zshrc.local file to get the environment variables
source "$HOME/.zshrc.local" 2>/dev/null

# Get the value of the specified variable
PASSWORD_VALUE=$(eval echo \$$PASSWORD_VAR)

if [ -z "$PASSWORD_VALUE" ]; then
    echo "Password variable '$PASSWORD_VAR' not found in .zshrc.local"
    exit 1
fi

# Copy to clipboard
echo "$PASSWORD_VALUE" | pbcopy

echo "Copied $PASSWORD_VAR to clipboard"