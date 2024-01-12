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

# Open terminal for prompts
gnome-terminal -- bash c '

# If no changes in disallowed folders or files, allow the push
read -p "Minor (m) / Patch (p)? " bump_value
read -p "Commit message: " message

while [ "${bump_value}" != 'm' ] || [ "${bump_value}" != 'p' ]
do
	if [ 'm' = "${bump_value,,}" ]
	then
		grunt bump:minor --message="${message}"
	fi
	
	if [ 'p' = "${bump_value,,}" ]
	then
		grunt bump:patch --message="${message}"
	fi

	read -p "Minor (m) / Patch (p)? " bump_value
done

exit 1
'