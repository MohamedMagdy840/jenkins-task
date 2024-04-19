# Use an official Apache HTTP Server image as a parent image
FROM httpd:2.4

# Copy custom configuration file into the container
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf

# Expose port 9000 to the outside world
EXPOSE 9000
