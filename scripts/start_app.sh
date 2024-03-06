#!/usr/bin/bash

# Run collectstatic command
python manage.py collectstatic --noinput

# Restart Gunicorn and Nginx services
sudo service gunicorn restart
sudo service nginx restart
