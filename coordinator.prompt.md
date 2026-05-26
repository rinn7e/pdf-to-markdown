# Law Digitization Coordinator Instructions

You are the parent coordinator agent for the Cambodia Law Digitization project. Your role is to orchestrate the entire digitization workflow using the central toolkit inside `tools/` and parallel subagents.

Always follow the instructions below with absolute devotion and attention to detail.

---

## Workflow Steps

### Step 1: Target Identification
1. Run `./tools/get-next-law.sh` to automatically identify the successor `$LAW_NAME`:
   ```bash
   LAW_NAME=$(./tools/get-next-law.sh)
   echo "Detected LAW_NAME: $LAW_NAME"
   ```
2. If `temp/done/` is empty, ask the user which PDF to process.

### Step 2: Initialize Workspace
1. Run `./tools/init-workspace.sh "$LAW_NAME"`.
2. Confirm the workspace directory `temp/progress/$LAW_NAME/` is created successfully.

### Step 3: Extract PDF to Images
1. Run `./tools/pdf-to-images.sh "$LAW_NAME"`.
2. Read the console output to find the total page count $N$.
3. Verify that the files `page-01.png` (or `page-001.png` if three digits) to the last page are generated in `temp/progress/$LAW_NAME/1-output-images/`.
4. Note the padding format (e.g. 2-digit padding `page-01.png` or 3-digit padding `page-001.png`).

### Step 4: Parallel Page Digitization
1. Determine the total number of pages $N$ based on all images in `1-output-images/`.
2. Process pages in batches of parallel subagents. For each batch, determine the range of pages to process. If there are still pages left to process:
   - Let the remaining number of pages be $R$.
   - Calculate how many subagents to spawn and how many pages each will process:
     - If $R < 10$: Spawn $R$ subagents, each processing 1 page.
     - If $R \ge 10$ and $R < 100$: Spawn 10 subagents. Divide the $R$ pages as evenly as possible among the 10 subagents, so each subagent processes at most 10 pages (e.g., if $R=50$, each processes 5 pages; if $R=55$, 5 subagents process 6 pages and 5 subagents process 5 pages).
     - If $R \ge 100$: Spawn 10 subagents, each processing exactly 10 pages.
3. For each subagent in the current batch:
   - Spawn parallel `self` subagents with `Workspace: inherit`.
   - Provide the target range of pages (padded correctly matching the image filenames).
   - Instruct the subagent to run `tools/digitize.prompt.md` for each page in its range.
   - Instruct the subagent that they must NEVER request permission to access other directories. All the subagent does is read from the assigned source image and write the translation and Khmer markdown files. It has absolutely no need to access any other directory or run external commands.

4. Monitor the subagents:
   - Wait for all subagents in the current batch to finish.
   - If any subagent encounters the stop condition (only English words), it will report back.
   - The coordinator must immediately stop/kill any running subagents that are processing pages beyond that stop page, and delete any out-of-scope files that were generated.
5. If the current batch completes successfully and there are still pages left to process, repeat Step 4 for the remaining pages. Keep doing this batch-by-batch until all pages are done.


### Step 5: Merge Combined Markdown Files
1. Run `./tools/combine-md.sh "$LAW_NAME"`.
2. Verify that the combined Khmer and English markdown files are successfully created in `temp/progress/$LAW_NAME/3-combine-markdown/$LAW_NAME/`.

### Step 6: Complete and Move Workspace
1. Move the completed workspace directory from `temp/progress/$LAW_NAME` to `temp/done/$LAW_NAME`.
2. Verify the move is successful.
3. Report the completion and final links to the user.
