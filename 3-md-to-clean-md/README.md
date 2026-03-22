# Markdown Prettifier (AI-Based CLEAN)

This directory contains the logic and prompts for cleaning and prettifying markdown files generated from PDF OCR.

## Why AI is Needed

OCR (Optical Character Recognition) often produces messy output, especially for non-Latin scripts like Khmer. Common issues include:
- Missing combining characters (e.g., `្ន`, `្រ`, `េ`).
- Incorrect character mapping due to similar shapes.
- Broken layout and misaligned text blocks.
- Inability to handle non-text elements like logos, seals, or complex graphics.

We use **AI (Gemini)** to "fix and prettify" these files because it can:
1. **Compare** the OCR'd markdown with the **original page image**.
2. **Contextually correct** Khmer spelling and grammatical errors that OCR misses.
3. **Restore structure** (headers, lists, alignment) based on visual layout.
4. **Identify non-text elements** and replace them with descriptive markdown placeholders (e.g., `- <image-about-blah-blah>`).

## Setup

The specific prompt used for this task is stored in [gemini-prompt.md](./gemini-prompt.md).
