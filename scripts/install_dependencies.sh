#!/bin/bash 

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package repository
sudo apt-get update -y

# Install Python3, pip, and venv if they're not installed
sudo apt-get install -y python3 python3-venv python3-pip

# Create the directory for the application if it doesn't exist
if [ ! -d "/var/www/python-pet-app" ]; then
  sudo mkdir -p /var/www/python-pet-app
fi

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
