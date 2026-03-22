# 5-md-kh-to-en

This tool translates Khmer Markdown to English Markdown using an AI-based workflow.

## Objectives
- Translate Khmer text to English.
- Preserve the exact Markdown structure and style.
- Fix typos in the original Khmer text before translating.
- Add original Khmer text in brackets for technical or ambiguous terms.

## How to use
Run this prompt using Gemini (or another LLM) for each Markdown page or a combined document.

1. Provide the Khmer Markdown file as input.
2. Specify the target output directory and filename.
3. Ensure image placeholders (e.g., `[IMAGE: info]`) and headers are maintained exactly.
4. For words where the translation may be uncertain or needs precise legal reference, append the Khmer original in brackets: `translation (Original Khmer)`.
