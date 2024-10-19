#!/bin/bash

# Navigate to the application directory
cd /home/ubuntu/pet-app

# Activate the virtual environment
source venv/bin/activate

# Start the Flask app in the background
nohup python3 app.py > flask.log 2>&1 &
