#!/bin/bash

# If DELL U3223QE is connected and enabled, turn it off and on again
if niri msg -j outputs | jq -e 'to_entries[] | select(.value.model == "DELL U3223QE" and .value.current_mode != null)' > /dev/null 2>&1; then
    echo "DELL U3223QE detected and enabled"
else
    echo "DELL U3223QE not detected or not enabled, exiting"
    niri msg output "Dell Inc. DELL U3223QE JVRK1H3" off
    exit 1
fi

# Wait for monitors to be detected
sleep 2

# turn specific monitor off and on
niri msg output "Dell Inc. DELL U3223QE JVRK1H3" off
sleep 2
niri msg output "Dell Inc. DELL U3223QE JVRK1H3" on
