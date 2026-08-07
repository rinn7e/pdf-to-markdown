# Procedure: Digitizing Document Page Image

### 1. Goal
To extract text from a document page image into a prettified Markdown file (Original Language) and, unless translation is disabled or unnecessary, provide a matching English translation Markdown file.

### 2. Checklist Before Starting
* [ ] Source Image: `/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/temp/progress/{{PDF_NAME}}/1-output-images/page-{{PAGE_NUMBER}}.png`
* [ ] Target 1 (Original Language) Path: `/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/temp/progress/{{PDF_NAME}}/2-clean-markdown/page-{{PAGE_NUMBER}}.md`
* [ ] (Optional) Target 2 (English Translation) Path: `/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/temp/progress/{{PDF_NAME}}/2.1-en-markdown/page-{{PAGE_NUMBER}}-en.md` (Ignore/leave empty if "no English translation" is specified or if the original document is in English)

### 3. Step-by-Step Instructions

* **Step 1: Read the Source Image**
  * Use `view_file` to read the Source Image.
  * Do not write a script; perform the task manually.
  * Do not search the web. Only read data from the image.
  * Do not ask for permission to access other directories or files; scope is strictly limited to the specified Source Image and Target paths.

* **Step 2: Parse and Clean Markdown (Original Language)**
  * Extract text from the image in its original language, applying the following rules:
    * Must include important texts.
    * Don't include any images.
    * Don't include decorative text/icon.
    * Don't include page number.
    * Don't include footer text (examples: URL links or metadata).
    * Use heading up to h4 only.
    * **Spacing**: Use blank lines (double newlines) to separate all major blocks of content. This includes:
      * Between an introductory sentence and the start of a list. **Never** put the first list item on the same line as the introductory text.
      * Between individual list items (e.g., between point 1-, 2-, or language-specific numbering like ១-, ២-, etc.).
      * Between distinct paragraphs within a single article/section.
    * **No code block**: Original text doesn't have code, so do not use markdown code blocks (```) or inline code (`).
  * Write the parsed/cleaned markdown to Target 1.

* **Step 3: Translate to English (Skip if "no English translation" is specified, Target 2 is empty, the original document is in English, or processing Khmer version without translation request)**
  * *If translation is disabled, Target 2 is empty, the original document is already in English, or translation is not needed, skip this step.*
  * Translate the extracted text into English.
  * The English version must maintain the exact same markdown structure, spacing, and headings as the original version.
  * Write the English translation markdown to Target 2.

* **Step 4: Check Stop Condition**
  * If the page image contains ONLY English words:
    * Write the output, but then stop processing further pages and report back immediately.

### 4. How to Invoke this Procedure
To run this procedure, instruct the assistant with the following request:
* **To process a page image:**
  > "Please follow the procedure in `tools/digitize.procedure.md` to process page `{{PAGE_NUMBER}}` for `{{PDF_NAME}}`."
