I want you to extract texts from an image into a markdown file.
Also prettify that markdown file and provide an English translation.

**Source Image:**
`/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/temp/progress/{{LAW_NAME}}/1-output-images/page-{{PAGE_NUMBER}}.png`

**Target 1 (Original Khmer):**
`/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/temp/progress/{{LAW_NAME}}/2-clean-markdown/page-{{PAGE_NUMBER}}.md`

**Target 2 (English Translation):**
`/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/temp/progress/{{LAW_NAME}}/2.1-en-markdown/page-{{PAGE_NUMBER}}-en.md`

**extract/prettify rules**

- must include important texts
- don't include any images
- don't include decorative text/icon
- don't include page number
- don't include footer text (examples: `www.moj.gov.kh`)
- using heading up to h4 only
- **Spacing**: Use blank lines (double newlines) to separate all major blocks of content. This includes:
    - Between an introductory sentence and the start of a list. **Never** put the first list item on the same line as the introductory text.
    - Between individual list items (e.g., between point ១-, ២-, etc.).
    - Between distinct paragraphs within a single article/section.
- **No code block**: original text doesn't have code in them so don't use (```) or (`)

- **Translation**: The English version must maintain the exact same markdown structure, spacing, and headings as the original.

**Process**
- Do not write a script, make the changes manually.
- Use `view_file` to read the Source Image.
- Write the parsed/cleaned Khmer markdown to Target 1.
- Write the English translation markdown to Target 2.
- Do not search the web at all cost, all you do here is reading data from image and translation.
- Do not ask for permission to access any other directories or files; your scope is strictly limited to the specified Source Image and Target paths.
- **Stop condition**: If the page image contains ONLY English words, write it, but then stop processing further pages and report back immediately.


