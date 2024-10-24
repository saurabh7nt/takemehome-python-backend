#!/bin/bash

# Create a virtual environment if it doesn't exist
cd /var/www/python-pet-app

if [ ! -d "venv" ]; then
  sudo python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Debugging: List the contents of the directory
echo "Current directory contents:"
ls -la

# Check if the requirements.txt file exists
if [ -f "requirements.txt" ]; then
  echo "Installing dependencies from requirements.txt"
  pip install -r requirements.txt
else
  echo "requirements.txt not found"
  exit 1
fi

# Activate the virtual environment
source venv/bin/activate

# Start the Flask app in the background
nohup python3 main.py > flask.log 2>&1 &
