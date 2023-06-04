#!/bin/bash

package_name="minify"
package_exists=false

if npm list -g --depth 1 "$package_name" >/dev/null 2>&1; then
  echo "Package $package_name is already installed with NPM."
elif yarn list -g --depth=0 "$package_name" >/dev/null 2>&1; then
  echo "Package $package_name is already installed with Yarn."
elif pnpm list -g --depth=0 "$package_name" >/dev/null 2>&1; then
  echo "Package $package_name is already installed with PNPM."
else
  npm install -g "$package_name"
fi

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

source="./main.html"
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