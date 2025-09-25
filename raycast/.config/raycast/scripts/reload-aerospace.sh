#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Reload Aerospace
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ✈️
# @raycast.packageName Window Manager

# Documentation:
# @raycast.description Reload Aerospace window manager configuration
# @raycast.author moshe.azaria

# Check if aerospace is running
if ! pgrep -x "AeroSpace" > /dev/null; then
    echo "Aerospace is not running"
    exit 1
fi

# Reload aerospace configuration
aerospace reload-config

echo "Aerospace configuration reloaded"