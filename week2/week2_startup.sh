#!/bin/bash
SCRIPTNAME=$0;

# Create folder for server files
mkdir -p /var/server
msg 'Server directory created'

# Logging
logfile="/var/server/${SCRIPTNAME}.log"
msg () {
    if [ $? -eq 0 ];then
        echo "[$(date)] [INFO] $1  executed successfully" >> $logfile
    else
        echo "[$(date)] [ERR] $1 failed with exit code $?" >> $logfile
    fi
}

# Libraries
# Install Apache2
apt install apache2 -y
msg 'Apache installation'
service apache2 start
msg 'Start apache'
# Install PHP Server
apt update
apt install php libapache2-mod-php -y
msg 'PHP installation'

# restart apache2 after installing php
service apache2 restart
msg 'Restart Apache after PHP install'

# Install git
apt install git
msg 'Git installation'

# clone provided git repo
cd /var/server
git clone https://github.com/tsdevopsacp/sample-app.git
msg 'Clone Git repo'
# move server files to apache2 folder
cp -r sample-app/* /var/www/html
msg 'Webapp files copied to deployment directory'
