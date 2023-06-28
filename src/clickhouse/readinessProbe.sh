#!/bin/sh

set -e

resp=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8123)

case "$resp" in 
    200) echo "Clickhouse server returned HTTP 200 OK";;
    400) echo "Error: Clickhouse server returned HTTP 400 Bad Request" >&2; exit 1;;
    403) echo "Error: Clickhouse server returned HTTP 403 Forbidden" >&2; exit 1;;
    404) echo "Error: Clickhouse server returned HTTP 404 Not Found" >&2; exit 1;;
    500) echo "Error: Clickhouse server returned HTTP 500 Internal Server Error" >&2; exit 1;;
    *) echo "Error: Clickhouse server returned an unexpected HTTP status $resp" >&2; exit 1;;
esac