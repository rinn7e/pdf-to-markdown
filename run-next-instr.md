- run run-next.sh

- set old to empty string if this is the first tiem

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

- then run

3-combine-md.sh

- then update --old to use the processed pdf name
- and update current name to the next pdf target
in /home/rinne/projects/rinn7e-technology-project/cambodia-law-raw-pdf
- sample remain the same

- then run-next.sh (loop)