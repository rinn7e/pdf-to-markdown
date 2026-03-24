# 5-combine-markdown 📄📑

Merges multiple markdown files into a single document, named after the input directory by default, or an explicitly provided name.

## Usage
```bash
stack run -- -i <INPUT_DIR> -o <OUTPUT_DIR> [-n <NAME>]
```

The output will be saved as `<OUTPUT_DIR>/<NAME or INPUT_DIR_NAME>.md`.

