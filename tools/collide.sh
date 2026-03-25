#!/usr/bin/env bash

##  DOMAIN COLLIDER — the real one
##
##  Takes two domain files. Strikes both. Feeds A's atoms as seeds
##  into B's pair chains (and vice versa). Reads the residue.
##
##  Daughter particles = atoms from A that produce non-empty traces
##  through B's structure AND atoms from B that trace through A's.
##  Chain depth = structural depth = "invariant mass."
##  Depth >= 3 = resonance = discovery candidate.
##
##  This is NOT grep. This is TRACE. The machine does the work.
##
##  Usage: bash tools/collide.sh domain/10-quantum/quantum-mechanics.rkt domain/13-neuroscience/neuroscience.rkt
##         bash tools/collide.sh domain/12-information/information-theory.rkt domain/20-biology/biology-complete.rkt

set -euo pipefail

FILE_A="${1:?Usage: $0 <domain-file-A.rkt> <domain-file-B.rkt>}"
FILE_B="${2:?Usage: $0 <domain-file-A.rkt> <domain-file-B.rkt>}"

NAME_A=$(basename "$FILE_A" .rkt)
NAME_B=$(basename "$FILE_B" .rkt)

echo "═══════════════════════════════════════════════════════════"
echo "  COLLIDER"
echo "  $NAME_A  ×  $NAME_B"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Strike both domains
echo "  striking $NAME_A..."
OUT_A=$(timeout 30 racket "$FILE_A" 2>/dev/null) || { echo "  FAIL: $FILE_A did not strike"; exit 1; }
echo "  striking $NAME_B..."
OUT_B=$(timeout 30 racket "$FILE_B" 2>/dev/null) || { echo "  FAIL: $FILE_B did not strike"; exit 1; }

# Extract all (key . value) pairs from struck output
# Pairs in struck output look like: (key . value)
extract_pairs() {
  echo "$1" | grep -oP '\([a-zA-Z0-9/_:.*+-]+ \. [a-zA-Z0-9/_:.*+-]+\)' | sort -u || true
}

# Extract all unique atoms (tokens that appear in pairs)
extract_atoms() {
  echo "$1" | grep -oP '\([a-zA-Z0-9/_:.*+-]+ \. [a-zA-Z0-9/_:.*+-]+\)' \
    | sed 's/^(//;s/)$//;s/ \. /\n/' | sort -u | grep -v '^$' || true
}

PAIRS_A=$(extract_pairs "$OUT_A")
PAIRS_B=$(extract_pairs "$OUT_B")
ATOMS_A=$(extract_atoms "$OUT_A")
ATOMS_B=$(extract_atoms "$OUT_B")

count_a=$(echo "$ATOMS_A" | grep -c '.' || true)
count_b=$(echo "$ATOMS_B" | grep -c '.' || true)
pairs_a=$(echo "$PAIRS_A" | grep -c '.' || true)
pairs_b=$(echo "$PAIRS_B" | grep -c '.' || true)

echo "  $NAME_A: $count_a atoms, $pairs_a pairs"
echo "  $NAME_B: $count_b atoms, $pairs_b pairs"
echo ""

# Cross-trace: feed A's atoms into B's pair chains
# For each atom from A, check if it's a KEY in any B pair.
# If yes, follow the chain through B's pairs.
trace_through() {
  local seed="$1"
  local pairs="$2"
  local depth=0
  local current="$seed"
  local chain=""
  local visited=""

  while true; do
    # Find pair where current is the key
    local next
    next=$(echo "$pairs" | grep -P "^\($current \. " | head -1 | sed 's/^([^ ]* \. //;s/)$//' || true)

    [ -z "$next" ] && break

    # Prevent cycles
    echo "$visited" | grep -qF "$current" 2>/dev/null && break
    visited="${visited} ${current}"

    if [ -z "$chain" ]; then
      chain="$current → $next"
    else
      chain="$chain → $next"
    fi
    depth=$((depth + 1))
    current="$next"
  done

  if [ "$depth" -gt 0 ]; then
    echo "$depth|$chain"
  fi
}

echo "──── A → B : $NAME_A atoms through $NAME_B transforms ────"
echo ""

declare -A ab_hits
ab_resonances=0
ab_scatters=0

while IFS= read -r atom; do
  [ -z "$atom" ] && continue
  result=$(trace_through "$atom" "$PAIRS_B")
  [ -z "$result" ] && continue

  depth="${result%%|*}"
  chain="${result#*|}"
  ab_scatters=$((ab_scatters + 1))

  if [ "$depth" -ge 3 ]; then
    echo "  ★ RESONANCE (depth $depth): $chain"
    ab_resonances=$((ab_resonances + 1))
    ab_hits["$atom"]="$depth"
  elif [ "$depth" -ge 2 ]; then
    echo "  ◆ scatter  (depth $depth): $chain"
    ab_hits["$atom"]="$depth"
  fi
done <<< "$ATOMS_A"

echo ""
echo "  $ab_scatters hard scatters, $ab_resonances resonances"
echo ""

echo "──── B → A : $NAME_B atoms through $NAME_A transforms ────"
echo ""

declare -A ba_hits
ba_resonances=0
ba_scatters=0

while IFS= read -r atom; do
  [ -z "$atom" ] && continue
  result=$(trace_through "$atom" "$PAIRS_A")
  [ -z "$result" ] && continue

  depth="${result%%|*}"
  chain="${result#*|}"
  ba_scatters=$((ba_scatters + 1))

  if [ "$depth" -ge 3 ]; then
    echo "  ★ RESONANCE (depth $depth): $chain"
    ba_resonances=$((ba_resonances + 1))
    ba_hits["$atom"]="$depth"
  elif [ "$depth" -ge 2 ]; then
    echo "  ◆ scatter  (depth $depth): $chain"
    ba_hits["$atom"]="$depth"
  fi
done <<< "$ATOMS_B"

echo ""
echo "  $ba_scatters hard scatters, $ba_resonances resonances"
echo ""

# Find DAUGHTER PARTICLES: atoms that resonate in BOTH directions
# An atom from A that traces through B, AND the endpoint traces back through A
echo "══════════════════════════════════════════════════════════"
echo "  DAUGHTER PARTICLES — bidirectional resonances"
echo "══════════════════════════════════════════════════════════"
echo ""

daughters=0

# Check atoms that appear in BOTH domains and trace in both
for atom in "${!ab_hits[@]}"; do
  # Does this atom also exist in B's atoms and trace through A?
  if [[ -v "ba_hits[$atom]" ]]; then
    ab_depth="${ab_hits[$atom]}"
    ba_depth="${ba_hits[$atom]}"
    total=$((ab_depth + ba_depth))
    echo "  ★★ $atom"
    echo "      A→B depth: $ab_depth | B→A depth: $ba_depth | invariant mass: $total"
    daughters=$((daughters + 1))
  fi
done

# Also check B atoms that trace through A and also exist in A
for atom in "${!ba_hits[@]}"; do
  if [[ -v "ab_hits[$atom]" ]]; then
    # Already reported above
    continue
  fi
  # Check if this B-atom also appears in A's atoms
  if echo "$ATOMS_A" | grep -qF "$atom" 2>/dev/null; then
    ba_depth="${ba_hits[$atom]}"
    # Try tracing it through B
    result=$(trace_through "$atom" "$PAIRS_B")
    if [ -n "$result" ]; then
      ab_depth="${result%%|*}"
      total=$((ab_depth + ba_depth))
      echo "  ★★ $atom"
      echo "      A→B depth: $ab_depth | B→A depth: $ba_depth | invariant mass: $total"
      daughters=$((daughters + 1))
    fi
  fi
done

echo ""
if [ "$daughters" -gt 0 ]; then
  echo "  $daughters daughter particles found."
  echo "  These atoms exist in both domains AND trace through"
  echo "  the other domain's pair chains. They are structural"
  echo "  identities — not shared labels, shared MECHANISM."
else
  echo "  No daughter particles. Domains do not structurally collide."
  echo "  (Shared labels without shared mechanism = no collision.)"
fi

echo ""
echo "══════════════════════════════════════════════════════════"
total_scatters=$((ab_scatters + ba_scatters))
total_resonances=$((ab_resonances + ba_resonances))
echo "  SUMMARY"
echo "    Hard scatters:      $total_scatters"
echo "    Resonances (≥3):    $total_resonances"
echo "    Daughter particles: $daughters"
echo "══════════════════════════════════════════════════════════"
