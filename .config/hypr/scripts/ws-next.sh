#!/usr/bin/env bash
NUM_WORKSPACE=3
cur=$(hyprctl activeworkspace -j | jq -r '.id')
next=$((cur % 3 + 1 ))
hyprctl dispatch workspace "$next"
