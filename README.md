# PDF to Markdown Toolkit 📄➡️📝

[**GitHub Repository**](https://github.com/rinn7e/pdf-to-markdown)

A collection of tools to convert PDF documents into clean, structured Markdown files. This toolkit works in five stages:
1.  **PDF to Images**: Converts each page of a PDF into high-quality images.
2.  **Images to Markdown (OCR)**: Extracts text from images using Google Cloud Vision OCR.
3.  **Markdown Cleaning (AI)**: Fixes OCR errors and prettifies the layout using AI (Gemini).
4.  **Markdown Merging**: Combines multiple markdown pages into a single document.
5.  **English Translation (AI)**: Translates the final document while preserving structure and legal terminology.

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
| `--output-dir DIR` | `-o` | Directory to save output images | `.` |
| `--prefix PREFIX` | `-p` | Prefix for output filenames | `page` |
| `--format FORMAT` | `-f` | Output format: `png`, `jpeg`, `tiff` | `png` |

---

### 2. `2-images-to-md`
Extracts text from images in a directory using the **Google Cloud Vision API**.

#### Prerequisites
- **Haskell Stack**
- **Google Cloud Project** with Cloud Vision API enabled.
- **Service Account JSON Key**.

#### Installation
```bash
cd 2-images-to-md
stack build
```

#### Usage
```bash
stack run -- --input-dir <DIR> --output-dir <DIR> --credentials <FILE>
```

| Option | Shorthand | Description |
| :--- | :--- | :--- |
| `--input-dir DIR` | `-i` | Directory containing images |
| `--output-dir DIR` | `-o` | Directory to save extracted text |
| `--credentials FILE`| `-c` | Path to Google Cloud Service Account key |
| `--limit INT` | `-n` | (Optional) Limit number of files to process |

---

### 3. `3-md-to-clean-md`
Fixes OCR errors, corrects script-specific issues (e.g., Khmer combining characters), and prettifies the markdown layout using AI.

#### Prerequisites
- **AI Access** (e.g., Gemini API or an AI coding assistant).

#### Usage
Follow the instructions and use the prompt stored in [3-md-to-clean-md/gemini.prompt.md](./3-md-to-clean-md/gemini.prompt.md).

---

### 4. `4-combine-md`
Combines multiple markdown files from a directory into a single document, ensuring they are sorted correctly (e.g., `page-001.md`, `page-002.md`).

#### Installation
```bash
cd 4-combine-md
stack build
```

#### Usage
```bash
stack run -- -i <INPUT_DIR> -o <OUTPUT_DIR> [-n <FILE_NAME>]
```

The output will be saved as `<OUTPUT_DIR>/<FILE_NAME or INPUT_DIR_NAME>.md`.

---

### 5. `5-md-kh-to-en`
Translates Khmer markdown files into English markdown using AI, preserving the original structure and providing bracketed Khmer source text for technical terms.

#### Prerequisites
- **AI Access** (e.g., Gemini API or an AI coding assistant).

#### Usage
Follow the instructions and use the prompt stored in [5-md-kh-to-en/gemini.prompt.md](./5-md-kh-to-en/gemini.prompt.md).

---

## 🚀 Workflow Example

To convert a full PDF (e.g., Khmer legal text) to clean, translated markdown, follow this recommended workflow:

1.  **Prepare the project structure:**
    Create a new directory in `temp/` named after your PDF and set up the necessary output folders to keep each stage separate:
    ```bash
    # Replace 'my-pdf-name' with your actual PDF name
    mkdir -p temp/my-pdf-name/1-output-images
    mkdir -p temp/my-pdf-name/2-output-markdown
    mkdir -p temp/my-pdf-name/3-clean-markdown
    mkdir -p temp/my-pdf-name/4-combine-markdown
    mkdir -p temp/my-pdf-name/5-en-version
    ```
    Copy your PDF file into the created directory:
    ```bash
    cp path/to/your/document.pdf temp/my-pdf-name/
    ```

2.  **Stage 1: Generate Images from PDF:**
    ```bash
    cd 1-pdf-to-images
    stack run -- ../temp/my-pdf-name/document.pdf \
      -o ../temp/my-pdf-name/1-output-images \
      -p page -f png
    ```

3.  **Stage 2: Perform OCR:**
    ```bash
    cd ../2-images-to-md
    stack run -- \
      -i ../temp/my-pdf-name/1-output-images \
      -o ../temp/my-pdf-name/2-output-markdown \
      -c /path/to/your/google-ocr-credentials.json
    ```

4.  **Stage 3: Clean and Prettify (AI):**
    Use an AI model with the instructions in `3-md-to-clean-md/gemini.prompt.md` to process the raw OCR files from `temp/my-pdf-name/2-output-markdown/` into `temp/my-pdf-name/3-clean-markdown/`.

5.  **Stage 4: Merge into Final Document:**
    ```bash
    cd ../4-combine-md
    stack run -- \
      -i ../temp/my-pdf-name/3-clean-markdown \
      -o ../temp/my-pdf-name/4-combine-markdown \
      -n my-pdf-name
    ```
    *This will create `temp/my-pdf-name/4-combine-markdown/my-pdf-name.md`.*

6.  **Stage 5: Translate to English (AI):**
    Use an AI model with the prompt in `5-md-kh-to-en/gemini.prompt.md` to translate the final document from `temp/my-pdf-name/4-combine-markdown/` into `temp/my-pdf-name/5-en-version/`.

---

## 📂 Examples
Check the [examples/](./examples) directory for real-world legal documents processed with this toolkit, including sample automation scripts.

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](./LICENSE) file for the full text.
