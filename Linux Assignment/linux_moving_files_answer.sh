#!/bin/bash
#The source and destination uses file name because i am working in the same directory as ../../../../upstream
#if not working on the current directory, will specify the full path.

source="upstream_data"
destination="json_and_CSV"

#listing the file in the source folder and then filetring based on file extension
if ls "$source" |grep -E '.csv|.json' ; then
  echo 'csv and json files exist'
  mkdir -p "$destination"
  mv "$source"/*.csv "$source"/*.json "$destination"
  echo "Moving of $source to $destination is completed"
else
  echo 'csv and json files not exist'
fi