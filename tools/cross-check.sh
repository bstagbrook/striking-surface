#!/usr/bin/env bash

##  CROSS-DOMAIN CONSISTENCY CHECKER — harmonic interface
##
##  Usage: make domain-check
##         (or) for f in domain/**/*.rkt; do racket "$f"; done | ./tools/cross-check.sh
##
##  Reads struck output from ALL domain files (concatenated on stdin).
##  Checks:
##  1. LABEL COLLISIONS — same label used in different files with different targets
##  2. MEASUREMENT CONSISTENCY — same measurement atom appears with different values
##  3. COVERAGE — reports total labels, files, and cross-file references
##
##  Does not parse .rkt files. Rides on struck output.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/measurement-pattern.sh"

INPUT=$(cat)

echo "═══════════════════════════════════════════"
echo "  CROSS-DOMAIN CONSISTENCY CHECK"
echo "═══════════════════════════════════════════"
echo ""

# Extract all labels with their targets
# Pattern: (label (source...) (target...) (pairs...))
# We grab: label and the text up to the next label
LABELS=$(echo "$INPUT" | grep -oP '\(([a-zA-Z][a-zA-Z0-9*/_:-]*) \(' | sed 's/^(\([^ ]*\) .*/\1/' | sort)
UNIQUE_LABELS=$(echo "$LABELS" | sort -u)
TOTAL=$(echo "$LABELS" | grep -c . || true)
UNIQUE=$(echo "$UNIQUE_LABELS" | grep -c . || true)

echo "  Total labels: ${TOTAL}"
echo "  Unique labels: ${UNIQUE}"
echo ""

# Check for duplicate labels (same label, potentially different meanings)
DUPES=$(echo "$LABELS" | uniq -d)
if [ -n "$DUPES" ]; then
  echo "  DUPLICATE LABELS (appear in multiple domain files):"
  while IFS= read -r dup; do
    [ -z "$dup" ] && continue
    COUNT=$(echo "$LABELS" | grep -c "^${dup}$" || true)
    echo "    ${dup} — ${COUNT} occurrences"
  done <<< "$DUPES"
  echo ""
else
  echo "  No duplicate labels. Clean."
  echo ""
fi

# Extract all measurement atoms (contain digits and units like MeV, eV, GeV, s, m)
MEASUREMENTS=$(echo "$INPUT" | grep -oP "$MEASUREMENT_ATOM_RE" | sort)
UNIQUE_MEAS=$(echo "$MEASUREMENTS" | sort -u)
MEAS_COUNT=$(echo "$UNIQUE_MEAS" | grep -c . || true)

echo "  Measurement atoms: ${MEAS_COUNT}"

# Check for actual conflicts: same exact atom appearing with different
# values in different pair chains. We look for the same atom on BOTH
# sides of a pair — if atom X maps to Y in one file and Z in another,
# that's a real conflict.
PAIR_LEFTS=$(echo "$INPUT" | grep -oP '\(([a-zA-Z][a-zA-Z0-9.*/_-]*) \. ' | sed 's/^(\(.*\) \. $/\1/' | sort)
DUPE_PAIRS=$(echo "$PAIR_LEFTS" | uniq -d)

if [ -n "$DUPE_PAIRS" ]; then
  CONFLICTS=""
  while IFS= read -r key; do
    [ -z "$key" ] && continue
    # Find all values this key maps to
    VALUES=$(echo "$INPUT" | grep -oP "\(${key} \. ([a-zA-Z0-9.*/_-]+)\)" | sort -u)
    VAL_COUNT=$(echo "$VALUES" | grep -c . 2>/dev/null || true)
    if [ "$VAL_COUNT" -gt 1 ]; then
      CONFLICTS="${CONFLICTS}  CONFLICT — '${key}' maps to different values:\n"
      while IFS= read -r v; do
        [ -z "$v" ] && continue
        CONFLICTS="${CONFLICTS}    ${v}\n"
      done <<< "$VALUES"
    fi
  done <<< "$DUPE_PAIRS"

  if [ -n "$CONFLICTS" ]; then
    echo ""
    echo -e "$CONFLICTS"
    echo ""
    echo "═══════════════════════════════════════════"
    echo "  PAIR CONFLICTS — BUILD FAILED"
    echo "═══════════════════════════════════════════"
    exit 1
  else
    echo "  No pair conflicts. Clean."
  fi
else
  echo "  No pair conflicts. Clean."
fi

echo ""
echo "═══════════════════════════════════════════"
echo "  CHECK COMPLETE"
echo "═══════════════════════════════════════════"
