- deprecate all other steps
- there should be only be 3 steps
- update readme
- update examples


write a bash script that

./next <name> --old <old-name> --sample <sample-name>

what this script does is that it will

move examples/<old-name> dir, to temp/<old-name>

copy .sh and .md files in examples/<sample-name> to examples/<name>

copy /home/rinne/projects/my-package/cambodia-law-raw-pdf/<name>.pdf to examples/<name>

find-and-replace text in examples/<name>, where text = <sample-name>, with <name>

cd into examples/<name>, exec ./0-init.sh

then exec ./1-pdf-to-images.sh

then stop

example

./next.sh "3-law-on-public-finance-system-ច្បាប់ស្តីពីប្រព័ន្ធហិរញ្ញវត្ថុសាធារណៈ-2023" --old "3-law-on-prisons-ច្បាប់ស្តីពន្ធនាគារ-2011" --sample "2-law-on-supreme-council-of-magistracy-ច្បាប់ស្តីពីឧត្តមក្រុមប្រឹក្សានៃអង្គចៅក្រម-2014"