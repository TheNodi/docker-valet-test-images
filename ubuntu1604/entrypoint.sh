#!/bin/sh

# Update APT cache only on first run
if [ ! -f /tmp/entrypoint_done ]; then
    echo "Updating Apt-Get"
    sudo apt-get update
    touch /tmp/entrypoint_done
fi

exec "$@"
