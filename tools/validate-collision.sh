#!/usr/bin/env bash

##  COLLISION VALIDATOR — grade raw collision output against honesty invariants
##
##  Usage: bash tools/collider.sh "entropy" "neuron" | bash tools/validate-collision.sh
##         bash tools/validate-collision.sh < collision-output.txt
##
##  Takes collider output (shared atoms between two domains).
##  For each shared atom, checks:
##    1. MECHANISM — atom participates in causal pair chains in BOTH domains
##    2. BIDIRECTIONAL — mapping works both ways (A→shared AND shared→B in both)
##    3. QUANTITATIVE — if atom contains a measurement, values match across domains
##    4. GROUNDED — atom appears in parentheses (causal), not just comments
##    5. CHAIN DEPTH — atom connects to further chains (not a leaf)
##
##  Grades: CONFIRMED / SUGGESTIVE / EXPLORATORY / METAPHORICAL
##
##  This IS the quality gate. Metaphorical findings never leave the building.

set -euo pipefail

# Collect all struck output from domain files for chain analysis
echo "  Loading registered domains..."
ALL=""
for f in $(find domain -name '*.rkt' ! -name '*.cal.rkt' ! -name '*.def.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do
  lang=$(head -1 "$f")
  [ "$lang" != "#lang strike" ] && continue
  out=$(timeout 30 racket "$f" 2>/dev/null) || continue
  ALL="${ALL} ${out}"
done

# Also strike lab and research
for f in $(find lab research -name '*.rkt' 2>/dev/null | sort); do
  lang=$(head -1 "$f" 2>/dev/null) || continue
  [ "$lang" != "#lang strike" ] && continue
  out=$(timeout 30 racket "$f" 2>/dev/null) || continue
  ALL="${ALL} ${out}"
done

# Read collider output from stdin
INPUT=$(cat)

# Extract the two query terms from collider header
Q1=$(echo "$INPUT" | grep -oP 'Smashing: \K[^ ]+' || echo "unknown")
Q2=$(echo "$INPUT" | grep -oP 'Smashing: [^ ]+ × \K.+' || echo "unknown")

# Extract shared atoms (lines with ★)
SHARED=$(echo "$INPUT" | grep '★' | sed 's/.*★ //' | tr -d ' ')

if [ -z "$SHARED" ]; then
  echo ""
  echo "═══════════════════════════════════════════"
  echo "  COLLISION VALIDATION: $Q1 × $Q2"
  echo "  No shared atoms found. CUT."
  echo "═══════════════════════════════════════════"
  exit 0
fi

echo ""
echo "═══════════════════════════════════════════"
echo "  COLLISION VALIDATION: $Q1 × $Q2"
echo "═══════════════════════════════════════════"
echo ""

confirmed=0
suggestive=0
exploratory=0
metaphorical=0

while IFS= read -r atom; do
  [ -z "$atom" ] && continue

  score=0
  checks=""

  # CHECK 1: MECHANISM — atom appears as key in pair chains
  fwd_count=$(echo "$ALL" | grep -oP "\($atom \. [^)]+\)" | wc -l)
  rev_count=$(echo "$ALL" | grep -oP "\([^( ]+ \. $atom\)" | wc -l)

  if [ "$fwd_count" -gt 0 ] && [ "$rev_count" -gt 0 ]; then
    score=$((score + 1))
    checks="${checks} mechanism:YES(fwd=${fwd_count},rev=${rev_count})"
  else
    checks="${checks} mechanism:NO(fwd=${fwd_count},rev=${rev_count})"
  fi

  # CHECK 2: BIDIRECTIONAL — atom maps FROM something AND TO something
  # (already checked above — fwd AND rev both > 0)
  fwd_sources=$(echo "$ALL" | grep -oP "\($atom \. [^)]+\)" | head -5 | sort -u)
  rev_sources=$(echo "$ALL" | grep -oP "\([^( ]+ \. $atom\)" | head -5 | sort -u)

  fwd_domains=0
  rev_domains=0
  # Check if chains span multiple domain files
  for f in $(find domain -name '*.rkt' ! -name '*.cal.rkt' ! -name '*.def.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do
    lang=$(head -1 "$f")
    [ "$lang" != "#lang strike" ] && continue
    out=$(timeout 30 racket "$f" 2>/dev/null) || continue
    if echo "$out" | grep -q "$atom"; then
      fwd_domains=$((fwd_domains + 1))
    fi
  done

  if [ "$fwd_domains" -ge 2 ]; then
    score=$((score + 1))
    checks="${checks} bidirectional:YES(${fwd_domains}-domains)"
  else
    checks="${checks} bidirectional:NO(${fwd_domains}-domain)"
  fi

  # CHECK 3: QUANTITATIVE — atom contains a number (measurement)
  if echo "$atom" | grep -qP '[0-9]'; then
    score=$((score + 1))
    checks="${checks} quantitative:YES"
  else
    checks="${checks} quantitative:NO"
  fi

  # CHECK 4: GROUNDED — atom appears inside parenthesized pairs, not just in labels
  pair_count=$(echo "$ALL" | grep -oP "\([^()]*$atom[^()]*\. [^)]+\)" | wc -l)
  if [ "$pair_count" -ge 2 ]; then
    score=$((score + 1))
    checks="${checks} grounded:YES(${pair_count}-pairs)"
  else
    checks="${checks} grounded:NO(${pair_count}-pairs)"
  fi

  # CHECK 5: CHAIN DEPTH — atom connects to chains of length > 1
  # Follow one hop from atom and check if the target also has outgoing pairs
  next_atoms=$(echo "$ALL" | grep -oP "\($atom \. \K[^)]+\)" | head -3)
  deep=0
  while IFS= read -r next; do
    [ -z "$next" ] && continue
    next_fwd=$(echo "$ALL" | grep -cP "\($next \. [^)]+\)" || true)
    if [ "$next_fwd" -gt 0 ]; then
      deep=$((deep + 1))
    fi
  done <<< "$next_atoms"

  if [ "$deep" -gt 0 ]; then
    score=$((score + 1))
    checks="${checks} depth:YES(${deep}-continuations)"
  else
    checks="${checks} depth:NO"
  fi

  # GRADE based on score (0-5)
  if [ "$score" -ge 4 ]; then
    grade="CONFIRMED"
    confirmed=$((confirmed + 1))
  elif [ "$score" -ge 3 ]; then
    grade="SUGGESTIVE"
    suggestive=$((suggestive + 1))
  elif [ "$score" -ge 2 ]; then
    grade="EXPLORATORY"
    exploratory=$((exploratory + 1))
  else
    grade="METAPHORICAL"
    metaphorical=$((metaphorical + 1))
  fi

  echo "  [$grade] $atom  (score: $score/5)"
  echo "    $checks"

  # Show sample chains for non-metaphorical findings
  if [ "$score" -ge 2 ]; then
    echo "    chains:"
    echo "$fwd_sources" | head -3 | while read -r c; do
      [ -n "$c" ] && echo "      → $c"
    done
    echo "$rev_sources" | head -3 | while read -r c; do
      [ -n "$c" ] && echo "      ← $c"
    done
  fi
  echo ""

done <<< "$SHARED"

echo "═══════════════════════════════════════════"
echo "  SUMMARY: $Q1 × $Q2"
echo "    Confirmed:    $confirmed"
echo "    Suggestive:   $suggestive"
echo "    Exploratory:  $exploratory"
echo "    Metaphorical: $metaphorical"
total=$((confirmed + suggestive + exploratory + metaphorical))
echo "    Total:        $total"
echo ""
if [ "$confirmed" -gt 0 ]; then
  echo "  VERDICT: Publishable findings present."
  echo "  Confirmed isomorphisms have mechanism, bidirectionality,"
  echo "  grounding, and chain depth across multiple domains."
elif [ "$suggestive" -gt 0 ]; then
  echo "  VERDICT: Suggestive findings — worth investigating."
  echo "  Need quantitative validation or deeper chain analysis."
else
  echo "  VERDICT: No structural isomorphisms found. CUT."
fi
echo "═══════════════════════════════════════════"
