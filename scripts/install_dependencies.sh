#!/bin/bash

# Update the package repository
sudo yum update -y

# Create the directory for the application if it doesn't exist
if [ ! -d "/home/python-backend/pet-app" ]; then
  mkdir -p /home/python-backend/pet-app
fi

# Install Python3 if it's not installed
sudo yum install -y python3

# Install virtualenv if it's not installed
sudo pip3 install virtualenv

# Create a virtual environment if it doesn't exist
cd /home/python-backend/pet-app
if [ ! -d "venv" ]; then
  virtualenv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install required packages
pip install -r requirements.txt
