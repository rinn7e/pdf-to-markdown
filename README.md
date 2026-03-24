# PDF to Markdown Toolkit 📄➡️📝

[**GitHub Repository**](https://github.com/rinn7e/pdf-to-markdown)

A collection of tools to convert PDF documents into clean, structured Markdown files. This toolkit works in three stages:
1.  **PDF to Images**: Converts each page of a PDF into high-quality images.
2.  **Image to Clean MD (EN)**: Fixes OCR errors and translates Khmer to English markdown using AI (Gemini).
3.  **Markdown Merging**: Combines multiple markdown pages into a single document.

---

## 🛠️ Tools Overview

### 1. `1-pdf-to-images`
Converts PDF files into images (PNG, JPEG, TIFF) using `pdftoppm`.

#### Prerequisites
- **Haskell Stack**
- **poppler-utils** (`pdftoppm` is required)
  ```bash
  # Debian/Ubuntu
  sudo apt-get install poppler-utils
  # macOS
  brew install poppler
  ```

#### Installation
```bash
cd 1-pdf-to-images
stack build
```

#### Usage
```bash
stack run -- <INPUT_PDF> [OPTIONS]
```

| Option | Shorthand | Description | Default |
| :--- | :--- | :--- | :--- |
| \`--output-dir DIR\` | \`-o\` | Directory to save output images | \`.\` |
| \`--prefix PREFIX\` | \`-p\` | Prefix for output filenames | \`page\` |
| \`--format FORMAT\` | \`-f\` | Output format: \`png\`, \`jpeg\`, \`tiff\` | \`png\` |

---

### 2. \`2-img-to-clean-md-en\`
Fixes OCR errors and translates Khmer markdown files into English markdown using AI, preserving the original structure.

#### Prerequisites
- **AI Access** (e.g., Gemini API or an AI coding assistant).

#### Usage
Follow the instructions and use the prompt stored in [2-img-to-clean-md-en/gemini.prompt.md](./2-img-to-clean-md-en/gemini.prompt.md).

---

### 3. \`3-combine-markdown\`
Combines multiple markdown files from a directory into a single document, ensuring they are sorted correctly (e.g., \`page-001.md\`, \`page-002.md\`).

#### Installation
```bash
cd 3-combine-markdown
stack build
```

#### Usage
```bash
stack run -- -i <INPUT_DIR> -o <OUTPUT_DIR> [-n <FILE_NAME>]
```

The output will be saved as \`<OUTPUT_DIR>/<FILE_NAME or INPUT_DIR_NAME>.md\`.

---

## 🚀 Workflow Example

To convert a full PDF (e.g., Khmer legal text) to clean, translated markdown, follow this recommended workflow:

1.  **Prepare the project structure:**
    Create a new directory in \`temp/\` named after your PDF and set up the necessary output folders to keep each stage separate:
    \`\`\`bash
    # Replace 'my-pdf-name' with your actual PDF name
    mkdir -p temp/my-pdf-name/1-output-images
    mkdir -p temp/my-pdf-name/2-clean-en-markdown
    mkdir -p temp/my-pdf-name/3-combine-markdown
    \`\`\`
    Copy your PDF file into the created directory:
    \`\`\`bash
    cp path/to/your/document.pdf temp/my-pdf-name/
    \`\`\`

2.  **Stage 1: Generate Images from PDF:**
    \`\`\`bash
    cd 1-pdf-to-images
    stack run -- ../temp/my-pdf-name/document.pdf \
      -o ../temp/my-pdf-name/1-output-images \
      -p page -f png
    \`\`\`

3.  **Stage 2: Clean and Translate (AI):**
    Use an AI model (like Gemini) with the instructions in \`2-img-to-clean-md-en/gemini.prompt.md\` to process the images from \`temp/my-pdf-name/1-output-images/\` into \`temp/my-pdf-name/2-clean-en-markdown/\`.

4.  **Stage 3: Merge into Final Document:**
    Merge the translated English files:
    \`\`\`bash
    cd ../3-combine-markdown
    stack run -- \
      -i ../temp/my-pdf-name/2-clean-en-markdown \
      -o ../temp/my-pdf-name/3-combine-markdown \
      -n my-pdf-name-en
    \`\`\`
    *This will create \`temp/my-pdf-name/3-combine-markdown/my-pdf-name-en.md\`.*

---

## 📂 Examples
Check the [examples/](./examples) directory for real-world legal documents processed with this toolkit, including sample automation scripts.

---

## 📜 License

This project is licensed under the **GNU General Public License v2.0**. See the [LICENSE](./LICENSE) file for the full text.
