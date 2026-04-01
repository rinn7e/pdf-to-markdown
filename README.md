# PDF to Markdown Toolkit

[**GitHub Repository**](https://github.com/rinn7e/pdf-to-markdown)

A comprehensive toolkit designed to convert PDF documents into structured, high-quality Markdown files. The conversion process is executed in three distinct stages:

1.  **PDF to Images**: High-resolution conversion of PDF pages into image formats.
2.  **Image to Clean MD (EN)**: Automated OCR error correction and translation from Khmer to English using AI models.
3.  **Markdown Merging**: Aggregation of individual markdown pages into a consolidated document.

---

## Tools Overview

### 1. `1-pdf-to-images`
Utilizes `pdftoppm` to convert PDF files into various image formats (PNG, JPEG, TIFF).

#### Prerequisites
- **Haskell Stack**
- **poppler-utils** (`pdftoppm` required)
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

### 2. `2-img-to-clean-md-en`
Automates OCR error correction and translates Khmer markdown content into English while maintaining the original document structure.

#### Prerequisites
- **AI Access** (e.g., Google Gemini API or a compatible AI assistant).

#### Usage
Refer to the instructions and implementation prompts located in [2-img-to-clean-md-en/gemini.prompt.md](./2-img-to-clean-md-en/gemini.prompt.md).

---

### 3. `3-combine-markdown`
Aggregates multiple markdown files from a specified directory into a single document, ensuring correct sequential order (e.g., `page-001.md`, `page-002.md`).

#### Installation
```bash
cd 3-combine-markdown
stack build
```

#### Usage
```bash
stack run -- -i <INPUT_DIR> -o <OUTPUT_DIR> [-n <FILE_NAME>]
```

The output document will be saved as `<OUTPUT_DIR>/<FILE_NAME or INPUT_DIR_NAME>.md`.

---

## Workflow Example

To convert a standard PDF (such as Khmer legal text) to clean, translated markdown, follow this recommended procedure:

0. **Preparation:**
Create a dedicated project directory within `temp/` and establish the required output subdirectories:
```bash
# Replace 'my-pdf-name' with the actual document identifier
mkdir -p temp/my-pdf-name/1-output-images
mkdir -p temp/my-pdf-name/2-clean-markdown
mkdir -p temp/my-pdf-name/2.1-en-markdown
mkdir -p temp/my-pdf-name/3-combine-markdown

# Copy the source PDF into the project directory
cp path/to/your/document.pdf temp/my-pdf-name/
```

1.  **Stage 1: Image Generation:**
    ```bash
    cd 1-pdf-to-images
    stack run -- ../temp/my-pdf-name/document.pdf \
      -o ../temp/my-pdf-name/1-output-images \
      -p page -f png
    ```

2.  **Stage 2: Processing and Translation:**
    Utilize the provided instructions in `2-img-to-clean-md-en/gemini.prompt.md` to process images from `temp/my-pdf-name/1-output-images/`. Output should be directed to `temp/my-pdf-name/2-clean-markdown/` (Khmer) and `temp/my-pdf-name/2.1-en-markdown/` (English).

3.  **Stage 3: Final Document Consolidation:**
    Merge the processed Khmer and English files:
    ```bash
    cd ../3-combine-markdown
    # Consolidate Khmer version
    stack run -- \
      -i ../temp/my-pdf-name/2-clean-markdown \
      -o ../temp/my-pdf-name/3-combine-markdown \
      -n my-pdf-name

    # Consolidate English version
    stack run -- \
      -i ../temp/my-pdf-name/2.1-en-markdown \
      -o ../temp/my-pdf-name/3-combine-markdown \
      -n my-pdf-name-en
    ```
    *This process generates `temp/my-pdf-name/3-combine-markdown/my-pdf-name.md` and `temp/my-pdf-name/3-combine-markdown/my-pdf-name-en.md`.*

---

## Examples
The [examples/](./examples) directory contains sample legal documents processed with this toolkit, including automation scripts.

---

## License

This project is licensed under the **GNU General Public License v2.0**. For more details, see the [LICENSE](./LICENSE) file.
