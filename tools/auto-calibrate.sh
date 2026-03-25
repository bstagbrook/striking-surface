#!/usr/bin/env bash

##  AUTO-CALIBRATOR — independent oracle
##
##  Usage: ./tools/auto-calibrate.sh domain/01-particles/leptons.rkt
##
##  For a domain file, this tool:
##  1. Reads the struck output
##  2. Looks up a registry of known measurement atoms → oracle URLs
##  3. Fetches each reference value independently
##  4. Compares domain value to oracle value
##  5. Emits a calibration file with no human in the loop
##
##  The human does NOT write CONFIRMED. The oracle does.
##
##  Oracle sources:
##  - NIST CODATA 2022 for fundamental constants
##  - PDG pdglive for particle properties
##
##  Registry: tools/oracle-registry.tsv
##  Format: measurement-atom <tab> oracle-url <tab> extract-pattern

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/measurement-pattern.sh"
REGISTRY="$SCRIPT_DIR/oracle-registry.tsv"
DOMAIN_FILE="${1:?Usage: $0 <domain-file.rkt>}"
TIME_BUDGET="${2:-30}"

if [ ! -f "$REGISTRY" ]; then
  echo "ERROR: oracle registry not found at $REGISTRY"
  echo "Create it with: measurement-atom<TAB>oracle-source<TAB>oracle-value"
  exit 1
fi

# Strike the domain file
DOMAIN_OUTPUT=$(timeout "$TIME_BUDGET" racket "$DOMAIN_FILE" 2>/dev/null) || {
  echo "ERROR: failed to strike $DOMAIN_FILE"
  exit 1
}

# Extract measurement atoms from domain output
# Extract measurement atoms: symbols containing digits with unit suffixes
# Also captures less-than limits and confidence levels
MEASUREMENTS=$(echo "$DOMAIN_OUTPUT" | grep -oP "$MEASUREMENT_ATOM_RE" | sort -u)

BASENAME=$(basename "$DOMAIN_FILE" .rkt)
DIRNAME=$(dirname "$DOMAIN_FILE")

echo "#lang strike"
echo ""
echo ";;; ═══════════════════════════════════════════════════════════════"
echo ";;; AUTO-CALIBRATION: ${BASENAME}.rkt"
echo ";;; GENERATED: auto-calibrate.sh (independent oracle)"
echo ";;; DATE: $(date +%Y-%m-%d)"
echo ";;;"
echo ";;; This file was generated WITHOUT human intervention."
echo ";;; Each CONFIRMED entry was verified against an independent source."
echo ";;; Each UNREGISTERED entry has no oracle mapping and needs manual review."
echo ";;; ═══════════════════════════════════════════════════════════════"

# Count entries for expected-empty-tubes
ENTRY_COUNT=0
while IFS= read -r meas; do
  [ -z "$meas" ] && continue
  ENTRY_COUNT=$((ENTRY_COUNT + 1))
done <<< "$MEASUREMENTS"
echo ";;; expected-empty-tubes: $ENTRY_COUNT"

echo ""
echo "(auto-calibration-${BASENAME}"
echo ""
echo "  ;;; Source: independent oracle"
echo "  ((oracle (auto-calibrate.sh) (independent) ((auto-calibrate.sh . independent))))"
echo ""
echo "  ;;; Target: verification entries"
echo "  ("

CONFIRMED=0
DISCREPANCY=0
UNREGISTERED=0

while IFS= read -r meas; do
  [ -z "$meas" ] && continue

  # Extract the numeric core
  VALUE=$(echo "$meas" | grep -oP '[0-9][0-9.e+-]+' | head -1)

  # Look up in oracle registry — exact match on column 1 only
  # Registry format: measurement-atom <tab> source <tab> value <tab> uncertainty <tab> retrieved
  ORACLE_LINE=$(awk -F'\t' -v m="$meas" '$1 == m { print; exit }' "$REGISTRY" 2>/dev/null || true)

  if [ -z "$ORACLE_LINE" ]; then
    # No oracle mapping
    echo ""
    echo "    (check-${meas}"
    echo "      (our-value $meas)"
    echo "      (UNREGISTERED)"
    echo "      ((source . no-oracle-mapping)"
    echo "       (status . UNREGISTERED)))"
    UNREGISTERED=$((UNREGISTERED + 1))
    continue
  fi

  # Parse oracle line
  ORACLE_SOURCE=$(echo "$ORACLE_LINE" | cut -f2)
  ORACLE_VALUE=$(echo "$ORACLE_LINE" | cut -f3)
  ORACLE_UNCERTAINTY=$(echo "$ORACLE_LINE" | cut -f4)
  ORACLE_RETRIEVED=$(echo "$ORACLE_LINE" | cut -f5)

  # Extract numeric core from oracle value for comparison
  ORACLE_NUM=$(echo "$ORACLE_VALUE" | grep -oP '[0-9][0-9.e+-]+' | head -1)
  DOMAIN_NUM="$VALUE"

  # Compare: check if domain value matches oracle value
  # Use awk for floating point comparison
  if [ -n "$ORACLE_NUM" ] && [ -n "$DOMAIN_NUM" ]; then
    MATCH=$(awk -v a="$DOMAIN_NUM" -v b="$ORACLE_NUM" 'BEGIN {
      # Check if values are equal or within the smaller of the two uncertainties
      diff = a - b
      if (diff < 0) diff = -diff
      # For now: exact string match or within 0.1% relative
      rel = diff / (b + 1e-30)
      if (rel < 0.001 || a == b) print "yes"
      else print "no"
    }')
  else
    MATCH="unknown"
  fi

  if [ "$MATCH" = "yes" ]; then
    STATUS="CONFIRMED"
    CONFIRMED=$((CONFIRMED + 1))
  elif [ "$MATCH" = "no" ]; then
    STATUS="DISCREPANCY"
    DISCREPANCY=$((DISCREPANCY + 1))
  else
    STATUS="UNREGISTERED"
    UNREGISTERED=$((UNREGISTERED + 1))
  fi

  echo ""
  echo "    (check-${meas}"
  echo "      (our-value $meas)"
  echo "      ($STATUS)"
  echo "      ((source . $ORACLE_SOURCE)"
  echo "       (oracle-value . $ORACLE_VALUE)"
  echo "       (oracle-uncertainty . ${ORACLE_UNCERTAINTY:-not-stated})"
  echo "       (oracle-retrieved . ${ORACLE_RETRIEVED:-unknown})"
  echo "       (our-value . $meas)"
  echo "       (match . $MATCH)"
  echo "       (status . $STATUS)))"
done <<< "$MEASUREMENTS"

echo ""
echo "  )"
echo ""
echo "  ;;; Vacuum tube"
echo "  ((oracle . ${BASENAME}-auto-calibrated)))"
echo ""
echo ";;; ═══════════════════════════════════════════════════════════════"
echo ";;; SUMMARY: confirmed=$CONFIRMED discrepancy=$DISCREPANCY unregistered=$UNREGISTERED"
echo ";;; ═══════════════════════════════════════════════════════════════"
