#!/bin/sh

set -e

resp=$(wget -S --spider -q http://localhost:8123 2>&1)
if echo "$resp" | grep -q "HTTP/1.1 200"; then
    echo "The server returned HTTP 200 OK"
else
    echo "Error the server did not return HTTP 200" >&2
    exit 1
fi