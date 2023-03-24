#!/usr/bin/env hash
export PYTHONPATH=$PYTHONPATH:$(pwd)

case "$1" in
    "")
        gunicorn --access-logfile=- --error-logfile=- -b 0.0.0.0:5000 -w 2 backend.server:app
        ;;
    "test")
        echo TBU
        ;;
    *)
        exec "$@"
        exit 1
        ::
esac
