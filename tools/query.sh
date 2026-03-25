#!/usr/bin/env bash

##  DOMAIN QUERY — O(1) search of the registered universe
##
##  Usage: bash tools/query.sh "dopamine"
##         bash tools/query.sh "superconductor"
##         bash tools/query.sh "Grover"

set -euo pipefail

QUERY="${1:?Usage: $0 <search-term>}"
DOMAIN_DIR="${2:-domain}"

echo "═══════════════════════════════════════════"
echo "  QUERY: $QUERY"
echo "═══════════════════════════════════════════"
echo ""

hits=0
for f in $(find "$DOMAIN_DIR" -name '*.rkt' ! -name '*.cal.rkt' ! -name '*.def.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do
  lang=$(head -1 "$f")
  [ "$lang" != "#lang strike" ] && continue

  out=$(timeout 30 racket "$f" 2>/dev/null) || continue

  # Check if query appears anywhere in output
  echo "$out" | grep -qi "$QUERY" || continue

  basename=$(basename "$f" .rkt)
  dirname=$(basename $(dirname "$f"))
  echo "  [$dirname/$basename]"

  # Find all atoms containing the query
  atoms=$(echo "$out" | tr '() ' '\n' | grep -i "$QUERY" | sort -u)
  while IFS= read -r atom; do
    [ -z "$atom" ] && continue
    # Find pairs where this atom is a key (source)
    fwd=$(echo "$out" | grep -oP "\($atom \. [^)]+\)" | head -3 || true)
    # Find pairs where this atom is a value (target)
    rev=$(echo "$out" | grep -oP "\([^( ]+ \. $atom\)" | head -3 || true)
    echo "    $atom"
    [ -n "$fwd" ] && echo "$fwd" | while read -r p; do echo "      → $p"; done
    [ -n "$rev" ] && echo "$rev" | while read -r p; do echo "      ← $p"; done
    hits=$((hits + 1))
  done <<< "$atoms"
  echo ""
done

echo "  $hits atoms matched across domain model."
echo "═══════════════════════════════════════════"
