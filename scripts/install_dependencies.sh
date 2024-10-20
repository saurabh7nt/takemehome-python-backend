#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Log the commands being executed
set -x

# Update the package repository
sudo apt-get update -y

# Install Python3, pip, and venv if they're not installed
sudo apt-get install -y python3 python3-venv python3-pip

# Create the directory for the application if it doesn't exist
if [ ! -d "/home/ubuntu/pet-app" ]; then
  echo "Creating /home/ubuntu/pet-app directory"
  sudo mkdir -p /home/ubuntu/pet-app
fi

# Navigate to the app directory
cd /home/ubuntu/pet-app || { echo "Directory /home/ubuntu/pet-app not found"; exit 1; }

# Create a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
  echo "Creating virtual environment"
  sudo python3 -m venv venv
else
  echo "Virtual environment already exists"
fi

# Activate the virtual environment
if [ -f "venv/bin/activate" ]; then
  source venv/bin/activate
else
  echo "Virtual environment activation script not found"
  exit 1
fi

# Install required packages
if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
else
  echo "requirements.txt not found"
  exit 1
fi
