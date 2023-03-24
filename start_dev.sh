#!/bin/bash

export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

export FLASK_APP=backend/server.py
export FLASK_ENV=development
export PYTHONPATH=$PYTHONPATH:$SCRIPT_DIR

gunicorn --access-logfile=- --error-logfile=- -b 0.0.0.0:5000 -w 2 backend.server:app
