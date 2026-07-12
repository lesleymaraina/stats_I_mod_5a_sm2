#!/bin/bash

# Usage: sh fix-css.sh filename.css

FILE="$1"

if [ -z "$FILE" ]; then
  echo "Error: No file provided."
  echo "Usage: sh $0 filename.css"
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
    -e 's/--r-heading-color: #222;/--r-heading-color: #2a76dd;/g' \
    "$FILE"
else
  # Linux
  sed -i \
    -e 's/--r-heading-color: #222;/--r-heading-color: #2a76dd;/g' \
    "$FILE"
fi

echo "Replacements applied to $FILE"

