# Dockerfile for data normalization automation solution
FROM ubuntu:latest

# Set working directory for the solution
WORKDIR /data_normalization

# Copy the shell script and input file into the container
COPY process_courses_p4.sh /data_normalization/
COPY scraped_courses.txt /data_normalization/

# Set execute permissions for the script
RUN chmod +x /data_normalization/process_courses_p4.sh

# Run the shell script with the input file
ENTRYPOINT ["/data_normalization/process_courses_p4.sh"]
