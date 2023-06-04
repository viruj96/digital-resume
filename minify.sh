#!/bin/bash

# Install minify node package
npm install -g minify

# Declare variables
css_line=20
css_text="	<link rel=stylesheet href='./dist/main.min.css'>"

js_line=23
js_text="	<script defer src='./dist/index.min.js'></script>"

theme_line=24
theme_text="	<script defer src='./dist/theme.min.js'></script>"

# Create directory if does not exist
directory="./dist"
if [ ! -d "$directory" ]; then
    mkdir -p "$directory"
fi

source="./index.html"
dest="./index.min.html"
temp_file=$(mktemp)

# Minify script and style files
minify ./styles/main.css > ./dist/main.min.css
minify ./scripts/index.js > ./dist/index.min.js
minify ./scripts/theme.js > ./dist/theme.min.js

# Update html script and style files
awk -v line="$css_line" -v text="$css_text" 'NR == line {$0 = text} {print}' "$source" > "$dest"
awk -v line="$js_line" -v text="$js_text" 'NR == line {$0 = text} {print}' "$dest" > "$temp_file" \
  && mv "$temp_file" "$dest" 
awk -v line="$theme_line" -v text="$theme_text" 'NR == line {$0 = text} {print}' "$dest" > "$temp_file" \
  && mv "$temp_file" "$dest" 

# Minify html file
minify $dest > $temp_file \
	&& mv "$temp_file" "$dest"