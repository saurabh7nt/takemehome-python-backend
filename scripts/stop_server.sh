#!/bin/bash

# Kill the Flask app if it's running
pkill -f "python3 main.py" || true
