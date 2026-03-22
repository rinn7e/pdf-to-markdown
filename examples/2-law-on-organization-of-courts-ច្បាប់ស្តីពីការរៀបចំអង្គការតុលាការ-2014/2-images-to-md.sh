#!/bin/bash
cd ../../2-images-to-md
stack run -- \
  -i "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/1-output-images" \
  -o "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/2-output-markdown" \
  -c /home/rinne/.config/gcloud/khmer-ocr-credentials.json
