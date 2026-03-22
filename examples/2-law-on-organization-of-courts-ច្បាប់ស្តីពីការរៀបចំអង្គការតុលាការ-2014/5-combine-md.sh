#!/bin/bash
cd ../../5-combine-markdown
# Combine Khmer
stack run -- \
  -i "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/3-clean-markdown" \
  -o "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/5-combine-markdown" \
  -n "2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014"

# Combine English
stack run -- \
  -i "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/4-en-markdown" \
  -o "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/5-combine-markdown" \
  -n "2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014-en"

