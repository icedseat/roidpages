#!/bin/bash

# Раскомментировать и задать расширения для входных и выходных файлов:
# $1 = extension of source files
# $2 = extension of target files

# Или выполнить в папке с файлами которые нужно конвертировать:
# ./pandoc-bulk.sh txt md


source_ext=$1
target_ext=$2

source_files=*.$source_ext

echo "-- Converting $source_ext to $target_ext in `pwd`"

for source_filename in $source_files
do
  # extension="${f##*.}"
  filename="${source_filename%.*}"
  target_filename="$filename.$target_ext"
  echo " - $source_filename"
  echo " + $target_filename"
  pandoc -s -o "$target_filename" "$source_filename"
  rm $source_filename
done
