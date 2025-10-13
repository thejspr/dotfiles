#!/bin/bash
# Script to fix blank monitor issue by cycling refresh rates

# Wait for monitors to be detected
sleep 2

# Get list of connected outputs
OUTPUTS=$(niri msg outputs | grep "^Output" | cut -d'"' -f2)

# For each Dell monitor, cycle the refresh rate
for output in $OUTPUTS; do
    if [[ "$output" == *"DELL"* ]]; then
        echo "Cycling refresh rate for: $output"

        # Get current mode info
        CURRENT_MODE=$(niri msg outputs | grep -A 20 "^Output \"$output\"" | grep "Current mode:" | awk '{print $3, $4, $5, $6}')

        # Try to set to a slightly different mode, then back
        # This forces the monitor to reinitialize
        if [[ "$output" == *"U3223QE"* ]]; then
            niri msg output "$output" mode 3840x2160@29.981
            sleep 0.5
            niri msg output "$output" mode 3840x2160@59.996
        elif [[ "$output" == *"S2722QC"* ]]; then
            niri msg output "$output" mode 3840x2160@59.940
            sleep 0.5
            niri msg output "$output" mode 3840x2160@60.000
        fi
    fi
done

echo "Monitor fix complete"
