#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/convert-to-docx.sh
# Requires: pandoc (https://pandoc.org/)

INPUT_MD="API-DOC.md"
COVER_MD="cover.md"
OUTPUT_DOCX="API-DOC.docx"
TEMP_MD=".temp_api_doc_combined.md"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc is not installed. Install pandoc and try again: https://pandoc.org/installing.html" >&2
  exit 2
fi

if [ ! -f "$INPUT_MD" ]; then
  echo "Error: $INPUT_MD not found in repository root." >&2
  exit 2
fi

# Build combined markdown (cover + page break + main doc)
cat "$COVER_MD" > "$TEMP_MD"
# Add a page break that pandoc will convert to a page break in DOCX
printf "\n\newpage\n\n" >> "$TEMP_MD"
cat "$INPUT_MD" >> "$TEMP_MD"

# Generate DOCX with a table of contents and simple styling
pandoc "$TEMP_MD" -s --toc --toc-depth=2 -o "$OUTPUT_DOCX"

# Cleanup
rm -f "$TEMP_MD"

echo "Generated $OUTPUT_DOCX"

echo "To create a Base64-encoded version: base64 $OUTPUT_DOCX > $OUTPUT_DOCX.b64"