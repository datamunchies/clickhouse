#!/bin/sh
set -e

# Check if the server at localhost on port 8123 responds successfully
if curl -fsS "http://localhost:8123/"; then
  echo "ClickHouse server is live"
else
  echo "Error: ClickHouse server is not responding successfully" >&2
  exit 1
fi