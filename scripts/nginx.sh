#!/usr/bin/bash

# Replace {YOUR_PROJECT_MAIN_DIR_NAME} with your actual project directory name
PROJECT_MAIN_DIR_NAME="django-aws-ec2-nginx-gunicorn"

# Replace {FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS} with the folder name where your nginx configuration file exists
FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS="core"

# Reload systemd daemon
sudo systemctl daemon-reload

# Remove default Nginx site if exists
sudo rm -f /etc/nginx/sites-enabled/default

# Copy Nginx configuration file
sudo cp "/home/ubuntu/$PROJECT_MAIN_DIR_NAME/nginx/nginx.conf" "/etc/nginx/sites-available/$FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS"

# Create symbolic link to enable Nginx site
sudo ln -s "/etc/nginx/sites-available/$FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS" "/etc/nginx/sites-enabled/"

# Add www-data user to ubuntu group
sudo gpasswd -a www-data ubuntu

# Restart Nginx service
sudo systemctl restart nginx
