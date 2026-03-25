#!/usr/bin/env bash

##  CALIBRATION SCAFFOLDER — harmonic interface
##
##  Usage: racket domain/01-particles/quarks.rkt | ./tools/scaffold-cal.sh quarks
##
##  Reads struck output from stdin.
##  Emits a .cal.rkt skeleton to stdout.
##  Does not parse .rkt files. Does not require Racket.
##  Rides on top of the striking surface output.

set -euo pipefail

NAME="${1:?Usage: racket domain/file.rkt | $0 <name>}"

# Read struck output from stdin
INPUT=$(cat)

# Extract labels: find all (label-name (source) (target) (pairs)) patterns
# A label is the first symbol after a ( that is followed by another (
# We look for the pattern: (symbol-name (
LABELS=$(echo "$INPUT" | grep -oP '\(([a-zA-Z][a-zA-Z0-9*/_-]*) \(' | sed 's/^(\([^ ]*\) .*/\1/' | sort -u)

# Filter out wrapper labels (domain-*, tesla-powers-*, calibration-*)
LABELS=$(echo "$LABELS" | grep -v '^domain-' | grep -v '^tesla-powers-' | grep -v '^calibration-')

# Emit calibration skeleton
cat <<EOF
#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: ${NAME}.rkt
;;; GENERATED: scaffold-cal.sh (harmonic interface)
;;;
;;; Fill in reference values. Change UNCHECKED to CONFIRMED
;;; or DISCREPANCY after verification against primary source.
;;; ═══════════════════════════════════════════════════════════════

(calibration-${NAME}

  ;;; Source: calibration process
  ((calibration (${NAME}) (check) ((${NAME} . check))))

  ;;; Target: verification entries
  (
EOF

while IFS= read -r label; do
  [ -z "$label" ] && continue
  cat <<EOF

    (check-${label}
      (our-claim ${label})
      (UNCHECKED)
      ((source . FILL-IN-PRIMARY-SOURCE)
       (retrieved . FILL-IN-DATE)
       (reference-value . FILL-IN)
       (status . UNCHECKED)))
EOF
done <<< "$LABELS"

cat <<EOF

  )

  ;;; Vacuum tube
  ((calibration . ${NAME}-calibrated)))
EOF
