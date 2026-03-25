#!/usr/bin/env bash

##  DOMAIN-TO-JSON — harmonic interface
##
##  Usage: racket domain/01-particles/quarks.rkt | ./tools/domain-to-json.sh
##         find domain -name '*.rkt' ! -name '*.cal.rkt' -exec sh -c 'racket "$1"' _ {} \; | ./tools/domain-to-json.sh
##
##  Reads struck output from stdin.
##  Emits JSON to stdout.
##  Does not parse .rkt files. Does not require Racket libraries.
##  Rides on top of the striking surface output.

set -euo pipefail

# The struck output is an s-expression on one line.
# We extract labels and their resolved pairs.
# Format: (label (source) (target) ((key . val) ...))

INPUT=$(cat)

# Extract all transform labels (same pattern as scaffolder)
LABELS=$(echo "$INPUT" | grep -oP '\(([a-zA-Z][a-zA-Z0-9*/_-]*) \(' | sed 's/^(\([^ ]*\) .*/\1/' | sort -u)
LABELS=$(echo "$LABELS" | grep -v '^domain-' | grep -v '^tesla-powers-' | grep -v '^calibration-')

COUNT=$(echo "$LABELS" | grep -c . || true)

echo "{"
echo "  \"generated\": \"domain-to-json.sh\","
echo "  \"count\": ${COUNT},"
echo "  \"labels\": ["

FIRST=true
while IFS= read -r label; do
  [ -z "$label" ] && continue
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    echo ","
  fi
  printf '    "%s"' "$label"
done <<< "$LABELS"

echo ""
echo "  ]"
echo "}"
