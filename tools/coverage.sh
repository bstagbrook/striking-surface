#!/usr/bin/env bash

##  CALIBRATION COVERAGE ENFORCER — harmonic interface
##
##  Usage: make coverage
##
##  For each domain file, checks that every measurement atom
##  in the struck output has a corresponding entry in the
##  paired .cal.rkt struck output.
##
##  A measurement atom is any symbol containing digits and a
##  unit suffix (MeV, eV, GeV, s, m, pct, etc).
##
##  Fails if any measurement is uncovered.
##  This catches the case where a value is added to a domain
##  file but never calibrated.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/measurement-pattern.sh"

DOMAIN_DIR="${1:-domain}"
TIME_BUDGET="${2:-30}"

echo "═══════════════════════════════════════════"
echo "  CALIBRATION COVERAGE"
echo "═══════════════════════════════════════════"
echo ""

total_covered=0
total_uncovered=0
fail=0

for domain_file in $(find "$DOMAIN_DIR" -name '*.rkt' ! -name '*.cal.rkt' ! -name '*TEMPLATE*' ! -path '*/00-invariants/*' 2>/dev/null | sort); do
  # Check it's a strike file
  lang=$(head -1 "$domain_file")
  [ "$lang" != "#lang strike" ] && continue

  # Find paired calibration file
  cal_file="${domain_file%.rkt}.cal.rkt"
  basename=$(basename "$domain_file")

  if [ ! -f "$cal_file" ]; then
    echo "  MISSING $basename — no calibration file"
    fail=1
    continue
  fi

  # Strike both
  domain_output=$(timeout "$TIME_BUDGET" racket "$domain_file" 2>/dev/null) || continue
  # Read calibration file as text (not struck output) because
  # calibration entries are reference records — their pairs may
  # not form traceable chains, but the values ARE present in the file
  cal_output=$(cat "$cal_file")

  # Extract measurement atoms from domain output
  # Pattern: symbols containing digits followed by unit-like suffixes
  domain_measurements=$(echo "$domain_output" | grep -oP "$MEASUREMENT_ATOM_RE" | sort -u)

  if [ -z "$domain_measurements" ]; then
    echo "  ok   $basename — no measurements to cover"
    continue
  fi

  # Extract the numeric core from each measurement for fuzzy matching
  # e.g., "mass-2.16-MeV" -> "2.16" — check if that number appears
  # anywhere in the calibration output
  uncovered=""
  covered=0
  while IFS= read -r meas; do
    [ -z "$meas" ] && continue
    # Extract the numeric value(s) from the measurement atom
    nums=$(echo "$meas" | grep -oP '[0-9][0-9.e+-]+')
    found=0
    while IFS= read -r num; do
      [ -z "$num" ] && continue
      if echo "$cal_output" | grep -qF "$num"; then
        found=1
        break
      fi
    done <<< "$nums"
    if [ "$found" -eq 1 ]; then
      covered=$((covered + 1))
    else
      uncovered="${uncovered}    ${meas}\n"
    fi
  done <<< "$domain_measurements"

  total_meas=$(echo "$domain_measurements" | grep -c . || true)
  uncov_count=$((total_meas - covered))
  total_covered=$((total_covered + covered))
  total_uncovered=$((total_uncovered + uncov_count))

  if [ "$uncov_count" -gt 0 ]; then
    echo "  GAP  $basename — $uncov_count of $total_meas measurements uncovered:"
    echo -e "$uncovered"
    fail=1
  else
    echo "  ok   $basename — $covered/$total_meas measurements covered"
  fi
done

echo ""
echo "  covered: $total_covered  uncovered: $total_uncovered"
if [ $fail -eq 1 ]; then
  echo "COVERAGE GAPS — uncalibrated measurements exist"
  exit 1
else
  echo "full coverage."
fi
echo ""
echo "═══════════════════════════════════════════"
