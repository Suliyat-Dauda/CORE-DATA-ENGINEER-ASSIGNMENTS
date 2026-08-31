#!/bin/bash

#Extract: Download a CSV file. You can access the CSV using this link.
# Save it into a folder called raw. Your script should confirm that the file has been saved in the raw folder.
RAW_DIR="raw"
OUTPUT_RAW_FILE="raw/extracted_data.csv"
CSV_PATH="C:\Users\dauda\Downloads\annual-enterprise-survey-2023-financial-year-provisional.csv"
TRANSFORMED_FOLDER="Transform"

# 1. Create the 'raw' folder if it doesn't already exist
echo "removing $RAW_DIR folder if already exist"
rm -rf "$RAW_DIR"
echo "Creating raw directory"
mkdir "$RAW_DIR"
echo "$RAW_DIR folder has been created"

# 2. Copy the local CSV file into the 'raw' folder
echo "Extracting CSV from path"
cp "$CSV_PATH" "$OUTPUT_RAW_FILE"
#cat "$CSV_PATH" "$OUTPUT_RAW_FILE"
#cd raw && ls

#3. Confirm the file exists with actual data, -using f is file exist and using -s is greater than 0kb
if [ -s "$OUTPUT_RAW_FILE" ];
then
    echo "Success: File successfully extracted and exists in '$OUTPUT_RAW_FILE'."
else
    echo "Error: Extraction failed."
fi

#____________________________________Transform________________________________________________
#Transform: After downloading the file, perform a simple transformation by renaming the column named
#Variable_code to variable_code. Then, select only the following columns: year, Value, Units,
#variable_code. Save the content of these selected columns into a file named 2023_year_finance.csv.
#This file should be saved in a folder called Transformed,
your Bash script should confirm that it was loaded into the folder.
echo "Starting Transformation"
mkdir -p "$TRANSFORMED_FOLDER" && touch "$TRANSFORMED_FOLDER/2023_year_finance.csv"

