I want you to extract texts from an image into a markdown file.
Also prettify that markdown file and provide an English translation.

**Example for Page 001:**

**Source:**
`/home/rinne/projects/my-package/pdf-to-markdown/temp/my-pdf-name/1-output-images/page-001.png`

**Target 1 (Original):**
`/home/rinne/projects/my-package/pdf-to-markdown/temp/my-pdf-name/2-clean-markdown/page-001.md`

**Target 2 (English):**
`/home/rinne/projects/my-package/pdf-to-markdown/temp/my-pdf-name/2.1-en-markdown/page-001-en.md`

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
- **Translation**: The English version must maintain the exact same markdown structure, spacing, and headings as the original.

**Process**
- do not write a script, make the changes manually
- process each page 1 by 1, not all at once
- for how many pages until you stop, if I don't tell you, that means, only stop when you finished all the pages