#!/bin/bash

# Function to move a window to a specific desktop
move_window_to_workspace() {
    local window_title="$1"
    local workspace_index="$2"
    local x_position="$3"
    local y_position="$4"

    # Find the window ID using xdotool
    window_id=$(xdotool search --name "$window_title")

    if [ -z "$window_id" ]; then
        echo "Window with title '$window_title' not found."
        return 1
    fi

    # echo "Found window ID: $window_id"

    # Move the window to the specified workspace
    xdotool set_desktop_for_window "$window_id" "$workspace_index"

    # Move the window to the specified position (optional)
    if [ -n "$x_position" ] && [ -n "$y_position" ]; then
      xdotool windowmove "$window_id" "$x_position" "$y_position"
      echo "Moved window '$window_title' to workspace $workspace_index at position ($x_position, $y_position)."
    else
      echo "Moved window '$window_title' to workspace $workspace_index."
    fi

}

# if the first argument is laptop then move slack to desktop 4
if [ "$1" == "laptop" ]; then
    move_window_to_workspace "Alacritty" 0
    move_window_to_workspace "Firefox" 1
    move_window_to_workspace "Obsidian" 2
    move_window_to_workspace "Slack" 3
    move_window_to_workspace "Google Chrome" 4
elif [ "$1" == "desktop" ]; then
    move_window_to_workspace "Alacritty" 0
    move_window_to_workspace "Firefox" 0
    move_window_to_workspace "Obsidian" 0
    move_window_to_workspace "Slack" 0
    move_window_to_workspace "Google Chrome" 1
fi

