#!/bin/bash
cd ../../1-pdf-to-images
stack run -- "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014.pdf" \
  -o "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/1-output-images" \
  -p page -f png
