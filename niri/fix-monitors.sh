#!/bin/bash

MONITOR="Dell Inc. DELL U3223QE JVRK1H3"

# Check if DELL U3223QE is connected
if ! niri msg -j outputs | jq -e 'to_entries[] | select(.value.model == "DELL U3223QE")' > /dev/null 2>&1; then
    echo "DELL U3223QE not detected, exiting"
    exit 1
fi

# Check if it's currently enabled
if niri msg -j outputs | jq -e 'to_entries[] | select(.value.model == "DELL U3223QE" and .value.current_mode != null)' > /dev/null 2>&1; then
    echo "DELL U3223QE detected and enabled, cycling off/on"
    niri msg output "$MONITOR" off
    sleep 2
    niri msg output "$MONITOR" on
else
    echo "DELL U3223QE detected but not enabled, turning on"
    sleep 2
    niri msg output "$MONITOR" on
fi
