# Translate Khmer Markdown to English

Translate the provided Khmer Markdown into English while strictly adhering to the following rules:

## Rules
1. **Preserve Structure**: Keep all Markdown formatting exactly as in the original (`#`, `##`, `*`, `_`, etc.).
2. **Handle Images**: Do not translate image placeholders like `[IMAGE: text]`. Keep them exactly as they are.
3. **Handle HTML/CSS**: Keep any HTML tags like `<p align="center">` or `<br>` exactly as they are.
4. **Fix Khmer Typos**: If the original Khmer text contains obvious typos (OCR errors), fix them mentally before translating to ensure the English version is accurate.
5. **Add Technical Brackets**: For legal, technical, or ambiguous terms, or where the English translation might not be definitive, include the original Khmer in brackets next to the English: `Translation (Original Khmer)`.
    - Example: `Independence (អត្តាធីនភាព)`, `Personality Rights (សិទ្ធិបុគ្គល)`.
6. **Translation Style**: Use formal, standard English suitable for legal or official documents.

## Input/Output
- **Input Directory**: `/path/to/3-clean-markdown/` (contains multiple `.md` files)
- **Output Directory**: `/path/to/4-en-markdown/` (translated files as `<original-name>-en.md`)

## Prompt
"Please translate all Khmer Markdown files in the provided input directory to English. For each file, ensure that you fix any typos found in the Khmer original first and follow the rules regarding image preservation, structural integrity, and bracketed Khmer for technical terms. Save the translated files into the output directory with the suffix `-en.md` added to the original filename."

