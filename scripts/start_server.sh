#!/bin/bash

cd /var/www/python-pet-app

# Check if virtual environment exists, if not create it
if [ ! -d "venv" ]; then
  sudo python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Check if the requirements.txt file exists
if [ -f "requirements.txt" ]; then
  echo "Installing dependencies from requirements.txt"
  pip install -r requirements.txt
else
  echo "requirements.txt not found"
  exit 1
fi

# Install Gunicorn if not already installed
pip install gunicorn

# Stop any running instance of the application
if pgrep gunicorn > /dev/null
then
  echo "Stopping Gunicorn"
  pkill gunicorn
fi

# Start the Flask app with Gunicorn
echo "Starting Flask app with Gunicorn"
nohup gunicorn --bind 0.0.0.0:5000 main:app > flask.log 2>&1 &
