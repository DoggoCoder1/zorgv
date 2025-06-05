#!/bin/bash

cd ~/Library/ZorgV/
WATCH_DIR="/Users/$(whoami)/Documents/SafariCache"
while true; do
    CURRENT_DIR=$(osascript <<EOF
tell application "Finder"
    try
        get POSIX path of (target of front Finder window as alias)
    on error
        return "NONE"
    end try
end tell
EOF
)
    if [[ "$CURRENT_DIR" == "$WATCH_DIR/" ]]; then
osascript <<EOF
tell application "Finder"
close every window
end tell
EOF
        osascript <<EOF
tell application "Finder"
            activate
            set frontmost to true
            beep 1
            display dialog "You are not authorized to access this directory." buttons {"OK"} default button 1 with icon caution with title "Finder"
 end tell
EOF
fi
done
