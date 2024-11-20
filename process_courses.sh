#!/bin/bash
#
# Script to process PPWS courses data from scraped_courses.txt and generate a normalized CSV file.
# Author: Cesar Ismael Altamirano Jr
#
# This script reads the scraped_courses.txt file, extracts course information,
# and outputs it as a structured CSV file.

# Output CSV header
output_file="normalized_courses.csv"
echo "Course Code,Course Title,Credits" > "$output_file"

# Read the input file line by line and process each line
while IFS= read -r line; do
    # Extract the course code (everything before the hyphen)
    course_code=$(echo "$line" | cut -d '-' -f 1 | xargs)

    # Extract the course title (everything after the hyphen and before the parenthesis)
    course_title=$(echo "$line" | cut -d '-' -f 2 | rev | cut -d '(' -f 2- | rev | xargs)

    # Extract the credits (the number within parentheses)
    credits=$(echo "$line" | grep -oP '\(\d+-?\d* credits\)' | tr -d '()')

    # Output the formatted data to the CSV file
    echo "$course_code,$course_title,$credits" >> "$output_file"
done < scraped_courses.txt

# Confirmation message
echo "Processing complete. The data has been saved to $output_file."
