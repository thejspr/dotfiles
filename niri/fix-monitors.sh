#!/bin/bash

# If `niri msg outputs` include DELL U3223QE, turn it off and on again
if niri msg outputs | grep -q "DELL U3223QE"; then
    echo "DELL U3223QE detected"
else
    echo "DELL U3223QE not detected, exiting"
    exit 1
fi

# Wait for monitors to be detected
sleep 2

# turn specific monitor off and on
niri msg output "Dell Inc. DELL U3223QE JVRK1H3" off
sleep 2
niri msg output "Dell Inc. DELL U3223QE JVRK1H3" on
