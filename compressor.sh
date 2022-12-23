#!/bin/bash

source_file=source.css
min_file=centerGoogleResult.css

cd `dirname "$0"`

content_raw=`cat ${source_file}`

echo "${content_raw}" \
| sed "s/\/\*.*\*\///g;/\/\*/,/\*\// d" \
| tr '\n' ' ' \
| tr -s ' ' ' ' \
| sed 's/^[ ][ ]*//g' \
| sed '/^$\|^\s*$/d' > ${min_file}

cat ${min_file} | xclip -sel clip
