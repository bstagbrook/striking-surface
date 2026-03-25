#!/usr/bin/env bash

##  HADRON COLLIDER — smash two domains at a shared label
##
##  Usage: bash tools/collider.sh "entropy" "neuron"
##         bash tools/collider.sh "wavelength" "consciousness"
##
##  Strikes ALL domain files, finds atoms matching BOTH queries,
##  traces the chains they participate in, and reports the
##  INTERSECTION — the structural identity between domains.
##
##  This IS the experiment. The residue IS the finding.

set -euo pipefail

Q1="${1:?Usage: $0 <domain-atom-1> <domain-atom-2>}"
Q2="${2:?Usage: $0 <domain-atom-1> <domain-atom-2>}"

echo "═══════════════════════════════════════════"
echo "  HADRON COLLIDER"
echo "  Smashing: $Q1 × $Q2"
echo "═══════════════════════════════════════════"
echo ""

# Collect all struck output
ALL=""
for f in $(find domain -name '*.rkt' ! -name '*.cal.rkt' ! -name '*.def.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do
  lang=$(head -1 "$f")
  [ "$lang" != "#lang strike" ] && continue
  out=$(timeout 30 racket "$f" 2>/dev/null) || continue
  ALL="${ALL} ${out}"
done

# Also strike lab and research files
for f in $(find lab research -name '*.rkt' 2>/dev/null | sort); do
  lang=$(head -1 "$f" 2>/dev/null)
  [ "$lang" != "#lang strike" ] && continue
  out=$(timeout 30 racket "$f" 2>/dev/null) || continue
  ALL="${ALL} ${out}"
done

# Find chains containing Q1
echo "  [$Q1] chains:"
Q1_CHAINS=$(echo "$ALL" | grep -oP "\([^(]*${Q1}[^)]*\. [^)]+\)" | sort -u | head -10 || true)
Q1_REV=$(echo "$ALL" | grep -oP "\([^( ]+ \. [^)]*${Q1}[^)]*\)" | sort -u | head -10 || true)
[ -n "$Q1_CHAINS" ] && echo "$Q1_CHAINS" | while read -r c; do echo "    → $c"; done
[ -n "$Q1_REV" ] && echo "$Q1_REV" | while read -r c; do echo "    ← $c"; done
echo ""

# Find chains containing Q2
echo "  [$Q2] chains:"
Q2_CHAINS=$(echo "$ALL" | grep -oP "\([^(]*${Q2}[^)]*\. [^)]+\)" | sort -u | head -10 || true)
Q2_REV=$(echo "$ALL" | grep -oP "\([^( ]+ \. [^)]*${Q2}[^)]*\)" | sort -u | head -10 || true)
[ -n "$Q2_CHAINS" ] && echo "$Q2_CHAINS" | while read -r c; do echo "    → $c"; done
[ -n "$Q2_REV" ] && echo "$Q2_REV" | while read -r c; do echo "    ← $c"; done
echo ""

# Find SHARED atoms — atoms that appear in chains of BOTH queries
echo "  COLLISION — shared structure:"
Q1_ATOMS=$(echo "$Q1_CHAINS $Q1_REV" | tr '(). ' '\n' | sort -u | grep -v '^$')
Q2_ATOMS=$(echo "$Q2_CHAINS $Q2_REV" | tr '(). ' '\n' | sort -u | grep -v '^$')
SHARED=$(comm -12 <(echo "$Q1_ATOMS") <(echo "$Q2_ATOMS") 2>/dev/null || true)

if [ -n "$SHARED" ]; then
  while read -r atom; do
    [ -z "$atom" ] && continue
    echo "    ★ $atom"
  done <<< "$SHARED"
else
  echo "    (no shared atoms — domains do not intersect at these labels)"
fi

echo ""
echo "═══════════════════════════════════════════"
