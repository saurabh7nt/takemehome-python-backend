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


