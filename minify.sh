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
  echo "Installing $package_name..."
  npm install -g "$package_name"
fi

# Declare variables
css="./dist/main.min.css"
css_line=19
css_text="	<link rel=stylesheet href='$css'>"

js="./dist/index.min.js"
js_line=22
js_text="	<script defer src='$js'></script>"

theme="./dist/theme.min.js"
theme_line=23
theme_text="	<script defer src='$theme'></script>"

# Create directory if does not exist
directory="./dist"
if [ ! -d "$directory" ]; then
    mkdir -p "$directory"
fi

source="./main.html"
dest="./index.html"
temp_file=$(mktemp)

# Minify script and style files
minify ./styles/main.css > $css
minify ./scripts/index.js > $js
minify ./scripts/theme.js > $theme

# Update html script and style files
awk -v line="$css_line" -v text="$css_text" 'NR == line {$0 = text} {print}' "$source" > "$dest"
awk -v line="$js_line" -v text="$js_text" 'NR == line {$0 = text} {print}' "$dest" > "$temp_file" \
  && mv "$temp_file" "$dest" 
awk -v line="$theme_line" -v text="$theme_text" 'NR == line {$0 = text} {print}' "$dest" > "$temp_file" \
  && mv "$temp_file" "$dest"

# Update anchor tag paths
regex="./views/[[:alnum:]_]+\.html"
sed -E 's/(<a[^>]*href=")\.\/views\/([^"]+)\.html"/\1.\/dist\/\2.min.html"/g' "$dest" > "$temp_file" \
  && mv "$temp_file" "$dest"

# Minify html files
views="./views"
views_css=20
views_js=21
for file_path in "$views"/*; do
  if [[ -f "$file_path" ]]; then
    filename=$(basename "$file_path")
    destination_path="$directory/${filename%.*}.min.${filename##*.}"
    awk -v line="$views_css" -v text="	<link rel=stylesheet href='.$css'>" 'NR == line {$0 = text} {print}' "$file_path" > "$destination_path"
    awk -v line="$views_js" -v text="	<script defer src='.$theme'></script>" 'NR == line {$0 = text} {print}' "$destination_path" > "$temp_file" \
      && mv "$temp_file" "$destination_path"
    sed -i -E 's/(<a[^>]*href=")\.\.\/main\.html#projects"/\1..\/index.html#projects"/g' "$destination_path"
    minify "$destination_path" > "$temp_file" \
      && mv "$temp_file" "$destination_path"
  fi
done

# Minify root html file
minify $dest > $temp_file \
	&& mv "$temp_file" "$dest"

echo Done minifiying files

last_commit=$(git log -1 --pretty=%B)
version=$((10#${last_commit: -1}))
new_version=$((version + 1))
git_message="publish v$new_version"
git add .
git status
git commit -m "$git_message"
git pull .
git push -u origin main