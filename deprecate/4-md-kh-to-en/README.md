# 4-md-kh-to-en

This tool translates a directory of Khmer Markdown files to English Markdown using an AI-based workflow.

## Objectives
- Batch translate multiple Khmer `.md` files to English.
- Preserve the exact Markdown structure and style.
- Fix typos in the original Khmer text before translating.
- Add original Khmer text in brackets for technical or ambiguous terms.

## How to use
Provide the [gemini.prompt.md](./gemini.prompt.md) to Gemini (or another LLM) along with the source directory of cleaned markdown files.

1.  **Input**: A directory containing cleaned Khmer markdown files (e.g., `3-clean-markdown/`).
2.  **Process**: The AI translates each file while maintaining structural integrity.
3.  **Output**: A directory containing the translated files with the `-en.md` suffix (e.g., `4-en-markdown/`).

