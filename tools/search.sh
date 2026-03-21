#!/bin/bash
# Search all registered strike tables for a label
# Usage: ./tools/search.sh gold
QUERY="$1"
if [ -z "$QUERY" ]; then
    echo "Usage: search.sh <label>"
    exit 1
fi
echo "=== Searching for '$QUERY' across all programs ==="
echo ""
for f in programs/*.rkt; do
    hits=$(grep -n "$QUERY" "$f" | grep -v '^[0-9]*:;;;')
    if [ -n "$hits" ]; then
        echo "--- $(basename $f) ---"
        echo "$hits" | sed 's/^/  /'
        echo ""
    fi
done
