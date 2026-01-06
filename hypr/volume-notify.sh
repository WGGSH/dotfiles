#!/bin/bash

# Volume notification script for DMS-Shell
# Stores notification ID to replace previous volume notifications

NOTIFY_ID_FILE="/tmp/volume_notify_id"
NOTIFY_TIME_FILE="/tmp/volume_notify_time"

# Get current volume percentage
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')

# Read previous notification ID if it exists
REPLACE_ID=0
if [ -f "$NOTIFY_ID_FILE" ]; then
    REPLACE_ID=$(cat "$NOTIFY_ID_FILE")

    # Check if notification has timed out (2000ms + 500ms buffer)
    if [ -f "$NOTIFY_TIME_FILE" ]; then
        LAST_TIME=$(cat "$NOTIFY_TIME_FILE")
        CURRENT_TIME=$(date +%s%N | cut -b1-13)
        TIME_DIFF=$((CURRENT_TIME - LAST_TIME))

        # If more than 2500ms has passed, reset the ID
        if [ $TIME_DIFF -gt 2500 ]; then
            REPLACE_ID=0
        fi
    fi
fi

# Send notification and capture the new ID
NEW_ID=$(notify-send -a "Volume" -t 2000 -r "$REPLACE_ID" -p "🔊 Volume" "$VOLUME%" 2>/dev/null || echo "0")

# Save the new notification ID and current time for next replacement
echo "$NEW_ID" > "$NOTIFY_ID_FILE"
echo "$(date +%s%N | cut -b1-13)" > "$NOTIFY_TIME_FILE"
