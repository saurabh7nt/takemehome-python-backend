#!/bin/bash

# Update the package repository
sudo yum update -y

# Create the directory for the application if it doesn't exist
if [ ! -d "/home/ubuntu/pet-app" ]; then
  mkdir -p /home/ubuntu/pet-app
fi

# Install Python3 if it's not installed
sudo yum install -y python3

# Install virtualenv if it's not installed
sudo pip3 install virtualenv

# Create a virtual environment if it doesn't exist
cd /home/ubuntu/pet-app

if [ ! -d "venv" ]; then
  virtualenv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install required packages
pip install -r requirements.txt
