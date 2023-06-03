#!/bin/bash

npm install -g minify

directory="./dist"

if [ ! -d "$directory" ]; then
    mkdir -p "$directory"
fi

minify ./scripts/index.js > ./dist/index.min.js
minify ./scripts/theme.js > ./dist/theme.min.js
minify ./styles/main.css > ./dist/main.min.css

input_file="./index.html"
output_file="./dist/index.min.html"
css_line=19
index_line=22
theme_line=23
min_css="	<link rel="stylesheet" href="./dist/main.min.css" />"
min_index="	<script defer src="./dist/index.min.js"></script>"
min_theme="	<script defer src="./dist/theme.min.js"></script>"

temp_file=$(mktemp)

awk -v line="$css_line" -v text="$min_css" 'NR == line {$0 = text} {print}' "$input_file" > "$output_file"
awk -v line="$index_line" -v text="$min_index" 'NR == line {$0 = text} {print}' "$output_file" > "$temp_file"
mv "$temp_file" "$output_file"

awk -v line="$theme_line" -v text="$min_theme" 'NR == line {$0 = text} {print}' "$output_file" > "$temp_file"
mv "$temp_file" "$output_file"

minify ./dist/index.min.html > ${temp_file}
mv "$temp_file" "$output_file"

git config --global user.name "viruj96"
git config --global user.email "virujbala.96@gmail.com"
git add .
git commit -m "Commit dist folder"
git push