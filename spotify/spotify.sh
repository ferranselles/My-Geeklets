#!/bin/bash
DATA=`osascript ~/.geektool/spotify.applescript`

echo $DATA | awk -F new_line '{print $1}'

echo $DATA | awk -F new_line '{print $2}' 