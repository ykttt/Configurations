#!/usr/bin/env bash

SAVE_DIR="$HOME/pictures/localFiles/screenShots"
mkdir -p "$SAVE_DIR"

TIMESTAMP="$(date +%Y%m%d%H%M%S)"
FILE_FULL="$SAVE_DIR/screenshot-full-$TIMESTAMP.png"
FILE_AREA="$SAVE_DIR/screenshot-area-$TIMESTAMP.png"

notify_send() {
    local file="$1" mode="$2"
    if [[ -s "$file" ]]; then
        notify-send --icon="$file" --app-name="Screenshot" "$mode" "Saved to $file"
    else
        rm -f "$file"
        notify-send --app-name="Screenshot" "Error" "Failed to save screenshot"
    fi
}

case "$1" in
    full)
        # Full-screen with cursor
        wayshot -c --stdout > "$FILE_FULL"
        notify_send "$FILE_FULL" "Full Screenshot"
        ;;
    area|"")
        # Area selection via slurp
        wayshot -s "$(slurp -f '%x %y %w %h')" --stdout > "$FILE_AREA"
        notify_send "$FILE_AREA" "Area Screenshot"
        ;;
    *)
        notify-send --app-name="Screenshot" "Usage" "Use 'full' or 'area'(default)"
        ;;
esac
