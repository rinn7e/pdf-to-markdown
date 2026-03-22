# PDF to Markdown Toolkit 📄➡️📝

A collection of tools to convert PDF documents into clean, structured Markdown files. This toolkit works in three stages:
1.  **PDF to Images**: Converts each page of a PDF into high-quality images.
2.  **Images to Markdown**: Extracts text from images using Google Cloud Vision OCR.
3.  **Markdown Cleaning (AI)**: Fixes OCR errors and prettifies the layout using AI (Gemini).

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
Follow the instructions and use the prompt stored in [3-md-to-clean-md/gemini-prompt.md](./3-md-to-clean-md/gemini-prompt.md).

---

## 🚀 Workflow Example

To convert a full PDF to clean markdown, follow this recommended workflow:

1.  **Prepare the project structure:**
    Create a new directory in `temp/` named after your PDF and set up the necessary output folders:
    ```bash
    # Replace 'my-pdf-name' with your actual PDF name
    mkdir -p temp/my-pdf-name/1-output-images
    mkdir -p temp/my-pdf-name/2-output-markdown
    mkdir -p temp/my-pdf-name/3-clean-markdown
    ```
    Copy your PDF file into the created directory:
    ```bash
    cp path/to/your/document.pdf temp/my-pdf-name/
    ```

2.  **Generate Images from PDF:**
    ```bash
    cd 1-pdf-to-images
    stack run -- ../temp/my-pdf-name/document.pdf \
      -o ../temp/my-pdf-name/1-output-images \
      -p page -f png
    ```

3.  **Perform OCR:**
    ```bash
    cd ../2-images-to-md
    stack run -- \
      -i ../temp/my-pdf-name/1-output-images \
      -o ../temp/my-pdf-name/2-output-markdown \
      -c /path/to/your/google-ocr-credentials.json
    ```

4.  **Clean and Prettify (AI):**
    Use an AI model with the prompt from `3-md-to-clean-md/gemini-prompt.md` to process the files from `temp/my-pdf-name/2-output-markdown/` into `temp/my-pdf-name/3-clean-markdown/`.

---

## 📜 License
Refer to the individual tool directories for licensing information.
