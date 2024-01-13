#!/bin/bash

# Define disallowed folders and files
DISALLOWED_FOLDERS=("scripts" "styles" "views")
DISALLOWED_FILES=("main.html")

# Check if there are changes in disallowed folders or files
if git diff --cached --name-only | grep -qE "^($(IFS="|"; echo "${DISALLOWED_FOLDERS[*]}"))/|$(IFS="|"; echo "${DISALLOWED_FILES[*]}")$"; then
    echo "Minifying files:"
    ./minify.sh
    exit 1
fi

# If no changes in disallowed folders or files, allow the push
exit 0