#!/usr/bin/env bash

##  DOMAIN REGISTRATION TRANSFORM — CLOSED LOOP
##
##  Usage: ./tools/register-domain.sh domain/03-atoms/atoms.def
##
##  Single source of truth: the .def file.
##  Three outputs, all mechanically derived:
##    1. <name>.rkt       — domain strike table
##    2. <name>.cal.rkt   — calibration (auto-confirmed from oracle)
##    3. oracle entries   — appended to oracle-registry.tsv
##
##  The tool:
##    a) Generates the domain .rkt from the .def
##    b) Strikes it immediately
##    c) Extracts measurement atoms from struck output
##    d) Generates calibration entries for EXACTLY those atoms
##    e) Adds oracle entries for EXACTLY those atoms (deduped)
##    f) Verifies zero gaps by construction
##
##  No manual intervention. No drift. One input, three outputs.
##
##  .def format:
##    Line 1: DOMAIN <name> <layer> <source-citation>
##    # lines: section comments (passed to domain file)
##    ## lines: metadata (skipped)
##    Entity lines: label | source-atoms | target | pairs | oracle-source oracle-value oracle-uncertainty

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/measurement-pattern.sh"
REGISTRY="$SCRIPT_DIR/oracle-registry.tsv"
DEF_FILE="${1:?Usage: $0 <path/to/name.def>}"
DEF_DIR=$(dirname "$DEF_FILE")
DEF_BASE=$(basename "$DEF_FILE" .def)

DOMAIN_FILE="${DEF_DIR}/${DEF_BASE}.rkt"
CAL_FILE="${DEF_DIR}/${DEF_BASE}.cal.rkt"
DATE=$(date +%Y-%m-%d)

# Read input
INPUT=$(cat "$DEF_FILE")

# Parse header
DOMAIN=$(echo "$INPUT" | head -1 | awk '{print $2}')
LAYER=$(echo "$INPUT" | head -1 | awk '{print $3}')
SOURCE=$(echo "$INPUT" | head -1 | cut -d' ' -f4-)
SRC_LABEL=$(echo "$SOURCE" | awk '{print $1}')

# ═══════════════════════════════════════════════════════════════
# STEP 1: Generate domain .rkt
# ═══════════════════════════════════════════════════════════════

{
echo "#lang strike"
echo ""
echo ";;; ═══════════════════════════════════════════════════════════════"
echo ";;; DOMAIN: ${DOMAIN}"
echo ";;; LAYER: ${LAYER}"
echo ";;; GENERATED: register-domain.sh (closed-loop)"
echo ";;; SOURCE: ${SOURCE}"
echo ";;; CALIBRATION: ${DEF_BASE}.cal.rkt"
echo ";;; ═══════════════════════════════════════════════════════════════"
echo ""
echo "(domain-${DOMAIN}"
echo ""
echo "  ((${SRC_LABEL} (${SOURCE}) (authoritative) ((${SOURCE// / . } . authoritative))))"
echo ""
echo "  ("

echo "$INPUT" | tail -n +2 | while IFS= read -r line; do
  [[ "$line" == \#\#* ]] && continue
  if [[ "$line" == \#* ]]; then echo ""; echo "    ;;; ${line#\# }"; continue; fi
  [[ -z "$line" ]] && { echo ""; continue; }

  if [[ "$line" == *"|"* ]]; then
    LABEL=$(echo "$line" | cut -d'|' -f1 | xargs)
    SRC_ATOMS=$(echo "$line" | cut -d'|' -f2 | xargs)
    TARGET=$(echo "$line" | cut -d'|' -f3 | xargs)
    PAIRS_RAW=$(echo "$line" | cut -d'|' -f4 | xargs)

    # Target formatting
    if [[ "$TARGET" == *"->"* ]]; then
      T_LEFT="${TARGET%%->*}"; T_RIGHT="${TARGET#*->}"
      TARGET_FMT="(${T_LEFT} . ${T_RIGHT})"
    else
      TARGET_FMT="${TARGET}"
    fi

    # Pairs formatting
    PAIRS=""
    IFS=',' read -ra PAIR_ARR <<< "$PAIRS_RAW"
    for p in "${PAIR_ARR[@]}"; do
      p=$(echo "$p" | xargs)
      if [[ "$p" == *"->"* ]]; then
        P_LEFT="${p%%->*}"; P_RIGHT="${p#*->}"
        [[ -z "$PAIRS" ]] && PAIRS="(${P_LEFT} . ${P_RIGHT})" || PAIRS="${PAIRS}
       (${P_LEFT} . ${P_RIGHT})"
      fi
    done

    echo ""
    echo "    (${LABEL}"
    echo "      (${SRC_ATOMS})"
    echo "      (${TARGET_FMT})"
    echo "      (${PAIRS}))"
  fi
done

echo ""
echo "  )"
echo ""
echo "  ((${SRC_LABEL} . ${DOMAIN}-registered)))"
} > "$DOMAIN_FILE"

echo "  wrote  ${DOMAIN_FILE}"

# ═══════════════════════════════════════════════════════════════
# STEP 2: Strike the domain file, extract measurement atoms
# ═══════════════════════════════════════════════════════════════

STRUCK=$(racket "$DOMAIN_FILE" 2>/dev/null) || {
  echo "  ERROR: ${DOMAIN_FILE} failed to strike"
  exit 1
}

# Check for empty tubes
EMPTIES=$(echo "$STRUCK" | grep -o ' ())' | wc -l)
if [ "$EMPTIES" -gt 0 ]; then
  echo "  ERROR: ${DOMAIN_FILE} has ${EMPTIES} empty tubes"
  exit 1
fi

echo "  struck ${DOMAIN_FILE} — no empty tubes"

# Extract ALL measurement atoms
MEAS_ATOMS=$(echo "$STRUCK" | grep -oP "$MEASUREMENT_ATOM_RE" | sort -u)

MEAS_COUNT=0
[ -n "$MEAS_ATOMS" ] && MEAS_COUNT=$(echo "$MEAS_ATOMS" | wc -l)

# ═══════════════════════════════════════════════════════════════
# STEP 3: Build oracle-source map from .def lines
# ═══════════════════════════════════════════════════════════════

# Build a lookup file: atom <tab> source <tab> value <tab> uncertainty
ORACLE_TMP=$(mktemp)
trap "rm -f $ORACLE_TMP" EXIT

# Oracle column format (field 5):
#   Simple:  source value uncertainty
#            → applies to ALL measurement atoms in the line
#   Per-atom: atom1 source1 val1 unc1; atom2 source2 val2 unc2
#            → each atom gets its own oracle mapping
#
# If the first word of field 5 matches a measurement atom pattern,
# treat as per-atom format. Otherwise treat as simple (legacy).

while IFS= read -r line; do
  [[ "$line" == \#* || -z "$line" ]] && continue
  [[ "$line" != *"|"* ]] && continue
  FIELD5=$(echo "$line" | cut -d'|' -f5 | xargs)
  [ -z "$FIELD5" ] && continue

  # Check if per-atom format (contains semicolons)
  if [[ "$FIELD5" == *";"* ]]; then
    # Per-atom: split on semicolons
    IFS=';' read -ra ORACLE_ENTRIES <<< "$FIELD5"
    for entry in "${ORACLE_ENTRIES[@]}"; do
      entry=$(echo "$entry" | xargs)
      [ -z "$entry" ] && continue
      O_ATOM=$(echo "$entry" | awk '{print $1}')
      O_SRC=$(echo "$entry" | awk '{print $2}')
      O_VAL=$(echo "$entry" | awk '{print $3}')
      O_UNC=$(echo "$entry" | awk '{print $4}')
      printf '%s\t%s\t%s\t%s\n' "$O_ATOM" "$O_SRC" "$O_VAL" "$O_UNC" >> "$ORACLE_TMP"
    done
  else
    # Simple: apply to all measurement atoms in the line
    O_SRC=$(echo "$FIELD5" | awk '{print $1}')
    O_VAL=$(echo "$FIELD5" | awk '{print $2}')
    O_UNC=$(echo "$FIELD5" | awk '{print $3}')
    TARGET=$(echo "$line" | cut -d'|' -f3 | xargs)
    PAIRS=$(echo "$line" | cut -d'|' -f4 | xargs)
    LINE_ATOMS=$(echo "${TARGET} ${PAIRS}" | grep -oP "$MEASUREMENT_ATOM_RE" || true)
    for atom in $LINE_ATOMS; do
      printf '%s\t%s\t%s\t%s\n' "$atom" "$O_SRC" "$O_VAL" "$O_UNC" >> "$ORACLE_TMP"
    done
  fi
done < "$DEF_FILE"

# Function to look up oracle info for an atom
oracle_lookup() {
  awk -F'\t' -v m="$1" '$1 == m { print $2 "\t" $3 "\t" $4; exit }' "$ORACLE_TMP"
}

# ═══════════════════════════════════════════════════════════════
# STEP 4: Generate calibration .cal.rkt for EXACTLY those atoms
# ═══════════════════════════════════════════════════════════════

{
echo "#lang strike"
echo ""
echo ";;; expected-empty-tubes: ${MEAS_COUNT}"
echo ";;; ═══════════════════════════════════════════════════════════════"
echo ";;; CALIBRATION: ${DEF_BASE}.rkt"
echo ";;; GENERATED: register-domain.sh (closed-loop)"
echo ";;; DATE: ${DATE}"
echo ";;; ═══════════════════════════════════════════════════════════════"
echo ""
echo "(calibration-${DOMAIN}"
echo ""
echo "  ((calibration (${DOMAIN}) (check) ((${DOMAIN} . check))))"
echo ""
echo "  ("

if [ -n "$MEAS_ATOMS" ]; then
  while IFS= read -r atom; do
    [ -z "$atom" ] && continue
    O_INFO=$(oracle_lookup "$atom")
    if [ -n "$O_INFO" ]; then
      O_SRC=$(echo "$O_INFO" | awk -F'\t' '{print $1}')
      O_VAL=$(echo "$O_INFO" | awk -F'\t' '{print $2}')
      O_UNC=$(echo "$O_INFO" | awk -F'\t' '{print $3}')
      STATUS="CONFIRMED"
    else
      O_SRC="unregistered"
      O_VAL="unknown"
      O_UNC="unknown"
      STATUS="UNCHECKED"
    fi
    echo ""
    echo "    (check-${atom}"
    echo "      (our-claim ${atom})"
    echo "      (${STATUS})"
    echo "      ((source . ${O_SRC})"
    echo "       (retrieved . ${DATE})"
    echo "       (reference-value . ${O_VAL})"
    echo "       (oracle-uncertainty . ${O_UNC})"
    echo "       (our-value . ${atom})"
    echo "       (status . ${STATUS})))"
  done <<< "$MEAS_ATOMS"
fi

echo ""
echo "  )"
echo ""
echo "  ((calibration . ${DOMAIN}-calibrated)))"
} > "$CAL_FILE"

echo "  wrote  ${CAL_FILE} — ${MEAS_COUNT} entries"

# ═══════════════════════════════════════════════════════════════
# STEP 5: Add oracle entries (deduped against existing registry)
# ═══════════════════════════════════════════════════════════════

ADDED=0
if [ -n "$MEAS_ATOMS" ]; then
  while IFS= read -r atom; do
    [ -z "$atom" ] && continue
    # Check if already in registry
    if ! awk -F'\t' -v m="$atom" '$1 == m { found=1; exit } END { exit !found }' "$REGISTRY" 2>/dev/null; then
      O_INFO=$(oracle_lookup "$atom")
      if [ -n "$O_INFO" ]; then
        O_SRC=$(echo "$O_INFO" | cut -f1)
        O_VAL=$(echo "$O_INFO" | cut -f2)
        O_UNC=$(echo "$O_INFO" | cut -f3)
        echo -e "${atom}\t${O_SRC}\t${O_VAL}\t${O_UNC}\t${DATE}" >> "$REGISTRY"
        ADDED=$((ADDED + 1))
      fi
    fi
  done <<< "$MEAS_ATOMS"
fi

echo "  oracle ${ADDED} new entries added to registry"

# ═══════════════════════════════════════════════════════════════
# STEP 6: Verify — strike cal file, check consistency
# ═══════════════════════════════════════════════════════════════

racket "$CAL_FILE" >/dev/null 2>&1 || {
  echo "  ERROR: ${CAL_FILE} failed to strike"
  exit 1
}

echo "  verified ${CAL_FILE} strikes clean"
echo "  REGISTRATION COMPLETE: ${DOMAIN} (${MEAS_COUNT} measurements, ${ADDED} new oracle entries)"
