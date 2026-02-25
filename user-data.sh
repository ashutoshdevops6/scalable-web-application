#!/bin/bash
# user-data.sh script to install and configure web servers on EC2 instances

# Update the package index
sudo apt-get update

# Install Apache or Nginx based on user preference
# Uncomment the desired server installation

# For Apache
# sudo apt-get install -y apache2

# For Nginx
sudo apt-get install -y nginx

# Start the web server
# Uncomment the desired server startup

# For Apache
# sudo service apache2 start

# For Nginx
sudo service nginx start

# Enable the web server to start on boot
# For Apache
# sudo systemctl enable apache2

# For Nginx
sudo systemctl enable nginx

# Print a message indicating the web server has been installed
echo 'Web server has been installed and started.'