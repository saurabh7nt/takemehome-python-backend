#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package repository
sudo apt-get update -y

# Install Python3, pip, and venv if they're not installed
sudo apt-get install -y python3 python3-venv python3-pip

# Create the directory for the application if it doesn't exist
if [ ! -d "/home/ubuntu/pet-app" ]; then
  sudo mkdir -p /home/ubuntu/pet-app
fi

# Create a virtual environment if it doesn't exist
cd /home/ubuntu/pet-app

if [ ! -d "venv" ]; then
  sudo python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install required packages
pip install -r requirements.txt