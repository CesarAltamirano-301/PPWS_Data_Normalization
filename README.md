Course Normalization Project

Overview

Nnormalize semi-structured data into a structured format. The script (process_courses.sh) was developed to read through course information from scraped_courses.txt, extract key details like course code, title, and credits, and then generate a clean CSV file (normalized_courses.csv) containing this data.

Instructions for Running Script

Prerequisites:

Make sure you are working in a Linux environment.

Ensure you have Bash installed.

Make the Script Executable:

Before running the script, change its permissions to make it executable:

chmod +x process_courses.sh

Run the Script:

Execute the script to process the data and create the output CSV file:

./process_courses.sh

The script will read scraped_courses.txt and create normalized_courses.csv in the same directory.

Expected Output:

You should see a message indicating successful processing. The output file (normalized_courses.csv) will contain structured course information in CSV format.

Data Flow

Extraction

The script reads course information from the input file scraped_courses.txt. Each line of this file contains course details such as course code, title, and credit hours in a semi-structured format.

Normalization

The script extracts the course code, title, and credits from each line and writes this data to a CSV file (normalized_courses.csv). The CSV format makes it easy to manipulate and analyze the data.

Verification

To verify the output, open normalized_courses.csv using any text editor or a spreadsheet application like Excel.

You should see all course details properly formatted in columns: Course Code, Course Title, and Credits.

Additional Notes

If any data is missing or incorrectly formatted, consider adjusting the input file (scraped_courses.txt) and re-running the script. The current version of the script assumes that each line follows a consistent pattern.
