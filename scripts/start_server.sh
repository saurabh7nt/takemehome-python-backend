#!/bin/bash

# Navigate to the application directory
cd /var/www/python-pet-app

# Activate the virtual environment
source venv/bin/activate

# Start the Flask app in the background
nohup python3 main.py > flask.log 2>&1 &
