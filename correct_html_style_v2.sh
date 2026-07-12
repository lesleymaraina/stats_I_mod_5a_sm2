#!/bin/bash

# Usage: sh fix-html.sh filename.html

FILE="$1"

if [ -z "$FILE" ]; then
  echo "Error: No file provided."
  echo "Usage: sh $0 filename.html"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found!"
  exit 1
fi

# Detect OS (Linux vs macOS) for sed -i syntax
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  sed -i '' \
    -e 's/<h1 class="title">/<h2 style="color: #2A76DD;" class="title">/g' \
    -e 's#</h1>#</h2>#g' \
    -e 's#<div class="quarto-title-author-name">#<div style="font-size:20px;" class="quarto-title-author-name">#g' \
    "$FILE"
else
  # Linux
  sed -i \
    -e 's/<h1 class="title">/<h2 style="color: #2A76DD;" class="title">/g' \
    -e 's#</h1>#</h2>#g' \
    -e 's#<div class="quarto-title-author-name">#<div style="font-size:20px;" class="quarto-title-author-name">#g' \
    "$FILE"
fi

echo "Replacements applied to $FILE"

