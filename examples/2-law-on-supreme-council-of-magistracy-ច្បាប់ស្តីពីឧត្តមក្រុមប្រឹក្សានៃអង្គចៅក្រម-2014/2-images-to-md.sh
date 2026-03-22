#!/bin/bash
cd ../../2-images-to-md
stack run -- \
  -i "../examples/2-law-on-supreme-council-of-magistracy-ច្បាប់ស្តីពីឧត្តមក្រុមប្រឹក្សានៃអង្គចៅក្រម-2014/1-output-images" \
  -o "../examples/2-law-on-supreme-council-of-magistracy-ច្បាប់ស្តីពីឧត្តមក្រុមប្រឹក្សានៃអង្គចៅក្រម-2014/2-output-markdown" \
  -c /home/rinne/.config/gcloud/khmer-ocr-credentials.json
