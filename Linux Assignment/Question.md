# Linux and Git Project
You have been hired as a new Data Engineer at CoreDataEngineers. The CoreDataEngineers infrastructure is based on the Linux Operating System. Your manager has tasked you with the responsibility of managing the company’s data infrastructure and version control tool.

1. Your manager has assigned you the task of building a **Bash** script (use only bash scripting) that performs a simple ETL process:

    - **Extract:** Download a CSV file. You can access the CSV using this [link](https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv). Save it into a folder called `raw`. Your script should confirm that the file has been saved in the `raw` folder.

    - **Transform:** After downloading the file, perform a simple transformation by renaming the column named `Variable_code` to `variable_code`. Then, select only the following columns: `year, Value, Units, variable_code`. Save the content of these selected columns into a file named `2023_year_finance.csv`. This file should be saved in a folder called `Transformed`, your Bash script should confirm that it was loaded into the folder.

    - **Load:** Load the transformed data into a directory named `Gold`. Also, confirm that the file has been saved in the folder.

   Note: Use environment variables for the URL, and call it in your script. Write a well-detailed script, add sufficient comments to the script, and print out information for each step.

2. Your manager has asked you to schedule the script to run daily using cron jobs (research this). Schedule the script to run every day at 12:00 AM.

3. Write a Bash script to move all CSV and JSON files from one folder to another folder named `json_and_CSV`. Use any JSON and CSV of your choice; the script should be able to work with one or more JSON and CSV files.

4. All work done must be versioned using git.

## Submission Requirements
A GitHub Repository containing the project submission and a well documented README.