````markdown
# Generate API-DOC.docx

This helper adds a simple cover page and converts `API-DOC.md` into a Word document `API-DOC.docx` using Pandoc.

Prerequisites
- pandoc: https://pandoc.org/installing.html
- (optional) wkhtmltopdf or libreoffice is NOT required for this conversion.

Quick steps

1. Ensure you are in the repository root where `API-DOC.md` exists.
2. Make the conversion script executable: `chmod +x ./scripts/convert-to-docx.sh`
3. Run the script: `./scripts/convert-to-docx.sh`

Output
- `API-DOC.docx` will be created in the repository root.
- To create a Base64 representation you can run: `base64 API-DOC.docx > API-DOC.docx.b64`

Notes
- The script concatenates `cover.md` and `API-DOC.md`, inserts a page break, and invokes `pandoc` with `--toc` to generate a table of contents.
- If you want custom Word styles, you can supply a `reference.docx` to pandoc with `-V reference-doc=reference.docx` or replace the pandoc command accordingly.
````