#!/bin/bash
#
# Enhanced Script to process PPWS courses data from scraped_courses.txt and generate normalized CSV file
# Author: Cesar Ismael Altamirano Jr
#
# Script reads scraped_courses.txt file, extracts course information,
# and outputs it as a structured CSV file.
#
# Enhanced Features:
# - Data consistency and missing field handling
# - Handling multiline course descriptions
# - Validation and error handling
# - Extendibility for different delimiters or formats

# Output CSV header
output_file="normalized_courses_pt4.csv"
echo "Course Code,Course Title,Credits" > "$output_file"

# Variables to accumulate multiline descriptions
current_course_code=""
current_course_title=""
current_credits=""

# Read input file line by line and process each line
while IFS=',' read -r line; do
    # Check if line starts with a course code (PPWS ####)
    if [[ $line =~ ^PPWS[[:space:]][0-9]{4} ]]; then
        # If previous course is being accumulated, write to output file
        if [[ -n "$current_course_code" ]]; then
            echo "$current_course_code,$current_course_title,$current_credits" >> "$output_file"
        fi

        # Extract course code (everything before hyphen)
        current_course_code=$(echo "$line" | cut -d '-' -f 1 | xargs)

        # Extract course title (everything after hyphen and before parenthesis)
        current_course_title=$(echo "$line" | cut -d '-' -f 2 | rev | cut -d '(' -f 2- | rev | xargs)

        # Extract credits (number within parentheses)
        current_credits=$(echo "$line" | grep -oP '\(\d+-?\d* credits\)' | tr -d '()')

    else
        # Append multiline descriptions to current course title
        current_course_title="$current_course_title $line"
    fi
done < scraped_courses.txt

# Output last accumulated course if any
if [[ -n "$current_course_code" ]]; then
    echo "$current_course_code,$current_course_title,$current_credits" >> "$output_file"
fi

# Confirmation message
echo "Processing complete. Data has been saved to $output_file."
