#!/usr/bin/env sh

CONF_DIR="$(dirname "$(readlink -f "$0")")"
STYLE_FILE="$CONF_DIR/style.css"

write_style() {
    case "$(gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)" in
        *dark*) variant="colors-dark.css" ;;
        *)      variant="colors-light.css" ;;
    esac
    printf '@import url("%s");\n' "$variant" > "$STYLE_FILE"
}

# Stop any previous color-scheme watcher from an earlier invocation
pkill -f "gsettings monitor org.gnome.desktop.interface color-scheme" 2>/dev/null

# Terminate already running bar instances
killall -q waybar
while pgrep -x waybar >/dev/null; do sleep 1; done

write_style
waybar &

# Watch for color-scheme changes; waybar reloads style.css automatically
# thanks to reload_style_on_change in config.jsonc.
gsettings monitor org.gnome.desktop.interface color-scheme | while read -r _; do
    write_style
done
