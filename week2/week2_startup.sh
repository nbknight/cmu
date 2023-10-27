#!/bin/bash

# Libraries

# Install Apache2
apt install apache2 -y
service apache2 start
# Install PHP Server
apt update
apt install php libapache2-mod-php -y

# restart apache2 after installing php
service apache2 restart

# Is git installed

# Create a folder for organization and move into it
mkdir -p /home/ubuntu/server
cd /home/ubuntu/server

# clone provided git repo
git clone https://github.com/tsdevopsacp/sample-app.git

# move server files to apache2 folder
cp -r sample-app/* /var/www/html

# Still need to add logging and error handling