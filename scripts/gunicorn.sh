#!/usr/bin/bash

# Replace {YOUR_PROJECT_MAIN_DIR_NAME} with your actual project directory name
PROJECT_MAIN_DIR_NAME="django-aws-ec2-nginx-gunicorn"

# Copy gunicorn socket and service files
sudo cp "/home/ubuntu/$PROJECT_MAIN_DIR_NAME/gunicorn/gunicorn.socket" "/etc/systemd/system/gunicorn.socket"
sudo cp "/home/ubuntu/$PROJECT_MAIN_DIR_NAME/gunicorn/gunicorn.service" "/etc/systemd/system/gunicorn.service"

# Start and enable Gunicorn service
sudo systemctl start gunicorn.service
sudo systemctl enable gunicorn.service
