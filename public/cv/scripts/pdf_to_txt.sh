#!/bin/bash

# Define paths
ROOT_DIR="$(dirname "$0")/.."
INPUT="$ROOT_DIR/cv.pdf"
OUTPUT="$ROOT_DIR/cv.txt"

echo "[START] Executing PDF to TXT conversion."

# Convert to text
pdftotext -layout -enc UTF-8 "$INPUT" "$OUTPUT"

# Delete the Form Feed (FF) characters
tr -d '\f' < "$OUTPUT" > "$OUTPUT.tmp" && mv "$OUTPUT.tmp" "$OUTPUT"

# Fix the Técnico accent glitch
sed -i 's/T´\n *ecnico/Técnico/g' "$OUTPUT"
sed -i 's/T´ *ecnico/Técnico/g' "$OUTPUT"

echo "[END] Script has ended."