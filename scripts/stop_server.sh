#!/bin/bash

# Kill the Flask app if it's running
pkill -f "python3 app.py" || true
