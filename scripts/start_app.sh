#!/usr/bin/env bash
set -e

PROJECT_MAIN_DIR_NAME="django-aws-ec2-nginx-gunicorn"

# Validate variables
if [ -z "$PROJECT_MAIN_DIR_NAME" ]; then
    echo "Error: PROJECT_MAIN_DIR_NAME is not set. Please set it to your project directory name." >&2
    exit 1
fi

# Change ownership to ubuntu user
sudo chown -R ubuntu:ubuntu "/home/ubuntu/$PROJECT_MAIN_DIR_NAME"

# Change directory to the project main directory
cd "/home/ubuntu/$PROJECT_MAIN_DIR_NAME"

# Activate virtual environment
echo "Activating virtual environment..."
source "/home/ubuntu/$PROJECT_MAIN_DIR_NAME/venv/bin/activate"

# Run collectstatic command
echo "Running collectstatic command..."
python manage.py collectstatic --noinput

# Restart Gunicorn and Nginx services
echo "Restarting Gunicorn and Nginx services..."
sudo service gunicorn restart
sudo service nginx restart

echo "Application started successfully."
