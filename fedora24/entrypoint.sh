#!/bin/sh

# Update DNF cache only on first run
if [ ! -f /tmp/entrypoint_done ]; then
    echo "Updating DNF"
    sudo dnf makecache fast
    touch /tmp/entrypoint_done
fi

exec "$@"
