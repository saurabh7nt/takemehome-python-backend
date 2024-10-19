#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package repository
sudo apt-get update -y

# Create the directory for the application if it doesn't exist
if [ ! -d "/home/ubuntu/pet-app" ]; then
  mkdir -p /home/ubuntu/pet-app
fi

# Install Python3 and pip if they're not installed
if ! command -v python3 &>/dev/null; then
    sudo apt-get install -y python3 python3-venv python3-pip
fi

# Create a virtual environment if it doesn't exist
cd /home/ubuntu/pet-app

if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install required packages
pip install -r requirements.txt
