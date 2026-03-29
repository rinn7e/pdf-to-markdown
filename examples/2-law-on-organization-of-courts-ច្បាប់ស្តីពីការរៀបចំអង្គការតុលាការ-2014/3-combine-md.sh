#!/bin/bash
cd ../../3-combine-markdown

mkdir 2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014

# Combine Khmer
stack run -- \
  -i "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/2-clean-markdown" \
  -o "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/3-combine-markdown/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014" \
  -n "2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014"

# Combine English
stack run -- \
  -i "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/2.1-en-markdown" \
  -o "../examples/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014/3-combine-markdown/2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014" \
  -n "2-law-on-organization-of-courts-ច្បាប់ស្តីពីការរៀបចំអង្គការតុលាការ-2014-en"

