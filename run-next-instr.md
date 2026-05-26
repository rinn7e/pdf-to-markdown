- run run-next.sh

- (note: don't try to chmod +x, every script is executabled already)

- if there is a untrack directory in

/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/examples/**

use the dir name as --old, otherwise just set to empty string

the target pdf can be found in

/home/rinne/projects/rinn7e-technology-project/cambodia-law-raw-pdf

it should be the next pdf after the --old one

if --old is empty string, ask user which pdf file to process

```
#!/bin/bash

./next.sh \
  "5-law-on-food-safety-ច្បាប់ស្តីពីសុវត្ថិភាពម្ហូបអាហារ" \
  --old "" \
  --sample "2-law-on-supreme-council-of-magistracy-ច្បាប់ស្តីពីឧត្តមក្រុមប្រឹក្សានៃអង្គចៅក្រម-2014"
```

- when the it's done there will be script/prompt files created

- then run the prompt

/home/rinne/projects/rinn7e-technology-project/pdf-to-markdown/examples/<NAME>/2-img-to-clean-md-en.prompt.md

(Always spin up parallel `self` subagents with `Workspace: inherit` to process the pages in parallel chunks—for example, pages 11-20, 21-30, 31-40, 41-49 concurrently—since this transcription and translation work is fully parallelable)

- then run

3-combine-md.sh

- then update --old to use the processed pdf name
- and update current name to the next pdf target
in /home/rinne/projects/rinn7e-technology-project/cambodia-law-raw-pdf
- sample remain the same
