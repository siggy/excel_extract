#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

mkdir tmp
unzip "$1" xl/embeddings/*.bin -d tmp > /dev/null 2>&1

base=$(basename $1)_

for file in tmp/xl/embeddings/oleObject*.bin
do
  tmp=${file/oleObject/$base}
  tmp2=${tmp/.bin/.pdf}

  mv "$file" "$(echo $tmp2)"
done

mv tmp/xl/embeddings "$1_pdfs"
rmdir tmp/xl
rmdir tmp
