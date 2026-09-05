#!/bin/bash

#____________________________________Extracting________________________________________________
# Extracted the Downloaded CSV file from its file path and saving it in a folder called Raw.
RAW_DIR="Raw"
EXTRACTED_DATA="Raw/extracted_data.csv"
CSV_PATH="C:\Users\dauda\Downloads\annual-enterprise-survey-2023-financial-year-provisional.csv"
TRANSFORMED_FOLDER="Transform"
TRANSFORMED_DATA="$TRANSFORMED_FOLDER/2023_year_finance.csv"

# 1. Create the 'Raw' folder if it doesn't already exist
echo "removing $RAW_DIR folder if already exist"
rm -rf "$RAW_DIR"
echo "Creating Raw directory"
mkdir -p "$RAW_DIR"
echo "$RAW_DIR folder has been created"

# 2. Copy the local CSV file into the 'Raw' folder
echo "Extracting CSV from source path"
cp "$CSV_PATH" "$EXTRACTED_DATA"
echo "Extraction completed in path $EXTRACTED_DATA"

#3. Confirm the file exists with actual data, -using f is file exist and using -s is the size of the file is greater than 0kb
if [ -s "$EXTRACTED_DATA" ];
then
    echo "Success: File successfully extracted and exists in '$EXTRACTED_DATA'."
else
    echo "Error: Extraction failed."
fi

#____________________________________Transforming________________________________________________
#Transformed the columns by selecting year, Value, Units,variable_code and saving into file named 2023_year_finance.csv.

echo "Starting Transformation"
mkdir -p "$TRANSFORMED_FOLDER" && touch "$TRANSFORMED_DATA"

echo "year,Value,Units,variable_code" > "$TRANSFORMED_DATA"

gawk '
BEGIN {
    # FPAT defines fields: either quoted text OR non-comma text
    FPAT = "([^,]+)|(\"[^\"]+\")"
    OFS = ","
}
NR == 1 {
    for (i = 1; i <= NF; i++) {
        # Clean quotes or line returns from header names if present
        gsub(/^"|"$/, "", $i)
        if ($i == "Year")          col1 = i
        if ($i == "Value")         col2 = i
        if ($i == "Units")         col3 = i
        if ($i == "Variable_code") col4 = i
    }
}
NR > 1 {
    print $col1, $col2, $col3, $col4
}' "$EXTRACTED_DATA" >> "$TRANSFORMED_DATA"

echo "Transformation successfully completed"

#____________________________________Load________________________________________________
#Load the transformed data into a directory named Gold.

mkdir -p Gold
cp "$TRANSFORMED_DATA" Gold

if [ -s "Gold/2023_year_finance.csv" ];then
  echo "Gold file exist"
else
    echo "Gold file does not exist"
fi

